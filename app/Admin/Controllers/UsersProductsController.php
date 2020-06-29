<?php

namespace App\Admin\Controllers;

use App\Models\UsersProducts;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\Users;
use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Support\MessageBag;

class UsersProductsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用户商品';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $type  = \Request::get('type');
        $grid = new Grid(new UsersProducts());
        $grid->column('id', __('Id'));
        $grid->column('users.username', __('用户账号'));
        $grid->column('products.name', __('商品名称'));
        $grid->column('price', __('单价'));
        $grid->column('type', __('类型'))->display(function ($type){
            if($type == 1) {
                return  '买入';
            } else {
                return  '卖出';
            }
        });;
        $grid->column('num', __('总数量'));
        $grid->column('surplus', __('可用数量'));

        if(empty($type)) {
            $grid->column('assets', __('总资产'));
        } elseif ($type[0] == 1) {
            $grid->column('avg', __('平均价'))->display(function(){
                $avgArr = UsersProducts::where('id', '<', $this->id)
                ->where('type', $this->type)
                ->where('uid', $this->uid)
                ->where('products_id', $this->products_id)
                ->select('price','num')
                ->get();
                $num = $this->num;
                $avg = $this->price * $this->num;
                if(empty(count($avgArr))) {
                    $avg = ($this->price * $this->num) / $this->num;
                } else {
                    foreach ($avgArr as $k => $val) {
                        $num += $val->num;
                        $avg += $val->price * $val->num;
                    }
                    $avg = $avg / $num;
                }
                return $avg;
            });
        } else {
            $grid->column('loss', __('盈亏率'));
        }

        
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('修改时间'));
        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->actions(function ($actions) {
            $actions->disableEdit();
        });
        $grid->filter(function($filter){
            // 用户账号
            $user = Users::pluck('username','id');
            // 商品名称
            $pro = Products::pluck('name', 'id');
            $filter->column(1/2, function ($filter) use ($user) {                
                $filter->in('uid','用户账号')->multipleSelect($user);
                
            });

            $filter->column(1/2, function ($filter) use ($pro)  {    
                $filter->in('products_id','商品名称')->multipleSelect($pro);            
                $filter->in('type','类型')->multipleSelect([1=>'买入', 2=>'卖出']);
            });           

        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(UsersProducts::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('users.username', __('用户账号'));
        $show->field('products.name', __('商品名称'));
        $show->field('price', __('价格'));
        $show->field('type', __('类型'));
        $show->field('num', __('数量'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('修改时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new UsersProducts());

        $form->select('uid', __('用户账号'))->options(
            Users::query()->pluck('username', 'id')
        )
            ->rules('required', ['required' => '请选择用户账号'])
            ->load('pro', '/admin/userPro');

        $form->select('type', __('类型'))->options([1 => '买入', 2 => '卖出'])
            ->when(1, function (Form $form) {
                $form->select('products_id', __('商品名称'))->options(
                    Products::query()->pluck('name', 'id')
                );
                $form->number('price', __('金额'));
                $form->number('num', __('数量'));
                $form->hidden('surplus');
            })
            ->when(2, function (Form $form) {
                $form->select('pro', __('商品名称'));
                $form->number('price', __('金额'));
                $form->number('num', __('数量'));
            })
            ->rules('required', ['required' => '请选择类型']);
        $products_id = Request()->input('pro');
        // 保存前回调
        $form->saving(function (Form $form) use ($products_id) {
            $user               = Users::where('id', $form->uid)->first();
            // 卖出
            if ($form->type == 2) {
                $userPro           = UsersProducts::where('id', $products_id)->first();
                $form->products_id = $userPro->products_id;
                if ($form->num > $userPro->surplus) {
                    $error = new MessageBag([
                        'title'   => '错误提示',
                        'message' => '大于当前商品可用数量!',
                    ]);
                    return back()->with(compact('error'));
                }
                // 成本
                $market = $form->num * $userPro->price;
                // 卖出金额
                $sellMoney = $form->num * $form->price;
                // 盈亏
                $loss = $sellMoney - $market;

                $user->profit_loss  = $user->profit_loss + $loss;
                $user->market_value = $user->market_value - $market;
                $user->updated_at   = date('Y-m-d H:i:s');
                $user->save();

                // 扣减可用数量
                $userPro->surplus -= $form->num;
                $userPro->save();

                $lastNum = UsersProducts::where('uid', $form->uid)
                            ->where('products_id', $form->products_id)
                            ->orderBy('id','desc')
                            ->select('surplus')
                            ->first();
                $form->surplus = $lastNum->surplus - $form->num;

            } else {
                $lastNum = UsersProducts::where('uid', $form->uid)
                            ->where('products_id', $form->products_id)
                            ->orderBy('id','desc')
                            ->select('surplus')
                            ->first();
                if(!empty($lastNum)){
                    $form->surplus = $form->num + $lastNum->surplus;
                } else {
                    $form->surplus = $form->num;
                }
                
                $surplus = abs($user->assets - $user->market_value - abs($user->profit_loss));
                $price = $form->price * $form->num;
                if ($price > $surplus) {
                    $error = new MessageBag([
                        'title'   => '错误提示',
                        'message' => '该用户余额不足，是否转入资金？',
                    ]);
                    return back()->with(compact('error'));
                }
                Users::where('id', $form->uid)->increment(
                    'market_value',
                    $price
                );
            }
        });
        $form->ignore('pro');
        return $form;
    }

    public function userPro(Request $request)
    {
        $id = $request->get('q');

        $userPro = UsersProducts::query()
            ->where('uid', $id)
            ->where('type', 1)
            ->where('surplus', '>', 0)
            ->get();

        foreach ($userPro as $k => $pro) {
            $data[$k]['id'] = $pro->id;
            if ($pro->price >= 1000) {
                $price = number_format($pro->price / 10000, 1) . 'w';
            }
            $data[$k]['text'] = $pro->products->name . ' - 买入单价:' . $price . ' - 可用:' . $pro->surplus;
        }
        return $data;
    }
}
