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
    protected $title = '交易记录';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $type = \Request::get('type');
        $grid = new Grid(new UsersProducts());
        $grid->column('id', __('序号'));
        $grid->column('users.username', __('用户账号'));
        $grid->column('users.name', __('用户昵称'));
        $grid->column('products.name', __('商品名称'));
        $grid->column('price', __('单价'));
        $grid->column('type', __('类型'))->display(function ($type) {
            if ($type == 1) {
                return '买入';
            } else {
                return '卖出';
            }
        });
        $grid->column('num', __('总数量'));
        $grid->column('surplus', __('可用数量'));

        if (empty($type)) {
            $grid->column('surplus_cash', __('可用金额'));
            // $grid->column('surplus_cash', __('可用金额'))->display(function(){
            //     $users = Users::where('id', $this->uid)->first();
            //     return $users->assets-$users->market_value;
            // });
        } elseif ($type[0] == 1) {
            $grid->column('avg', __('总价'))->display(function ($loss) {
                return $this->price * $this->num;
            });
        } else {
            $grid->column('loss', __('盈亏'))->display(function ($loss) {
                if ($loss < 0) {
                    $str = "<span style='color:green'>{$loss}</span>";
                } else {
                    $str = "<span style='color:red'>{$loss}</span>";
                }
                return $str;
            });;
            $grid->column('loss_percent', __('盈亏率'))->display(function ($up) {
                if (stripos($up, '-') !== false) {
                    $str = "<span style='color:green'>{$up}</span>";
                } else {
                    $str = "<span style='color:red'>{$up}</span>";
                }
                return $str;
            });;
        }


        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('修改时间'));
        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->actions(function ($actions) {
            $actions->disableEdit();
        });
        $grid->tools(function ($tools) {
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });
        $grid->filter(function ($filter) {
            // 用户账号
            $userData = [];
            $user     = Users::query()->select('username', 'name', 'id')->get();
            foreach ($user as $k => $v) {
                $userData[$v['id']] = $v['username'] . '-' . $v['name'];
            }

            // 商品名称
            $pro = Products::query()->select('no_name', 'name', 'id')->get();
            foreach ($pro as $k => $v) {
                $proData[$v['id']] = $v['name'] . '-' . $v['no_name'];
            }
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) use ($userData) {
                $filter->equal('id', '序号');
                $filter->in('uid', '用户账号')->multipleSelect($userData);

            });

            $filter->column(1 / 2, function ($filter) use ($proData) {
                $filter->in('products_id', '商品名称')->multipleSelect($proData);
                $filter->in('type', '类型')->multipleSelect([1 => '买入', 2 => '卖出']);
            });

        });
        $grid->model()->orderBy('id', 'desc');
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

        $show->field('id', __('序号'));
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

        $data  = [];
        $users = Users::query()->select('username', 'name', 'id')->get();
        foreach ($users as $k => $v) {
            $data[$v['id']] = $v['username'] . '-' . $v['name'];
        }

        $form->select('uid', __('用户账号'))->options($data)
            ->rules('required', ['required' => '请选择用户账号'])
            ->load('pro', '/admin/userPro');

        $form->select('type', __('类型'))->options([1 => '买入', 2 => '卖出'])
            ->when(1, function (Form $form) {
                $pro = Products::query()->select('no_name', 'name', 'id')->get();
                foreach ($pro as $k => $v) {
                    $data[$v['id']] = $v['name'] . '-' . $v['no_name'];
                }

                $form->select('products_id', __('商品名称-批号'))->options($data)->rules('required', ['required' => '请选择商品']);
                $form->number('price', __('金额'));
                $form->number('num', __('数量'))->min(1);
                $form->hidden('surplus');
                $form->hidden('loss');
                $form->hidden('loss_percent');
                $form->hidden('available');
            })
            ->when(2, function (Form $form) {
                $form->select('pro', __('商品名称'))->rules('required', ['required' => '请选择商品']);
                $form->number('price', __('金额'));
                $form->number('num', __('数量'))->min(1);
                $form->hidden('from_id');
                $form->hidden('loss');
                $form->hidden('loss_percent');
            })
            ->rules('required', ['required' => '请选择类型']);
        $products_id = Request()->input('pro');
        // 保存前回调
        $form->saving(function (Form $form) use ($products_id) {
            $user = Users::where('id', $form->uid)->first();
            // 卖出
            if ($form->type == 2) {
                $form->from_id     = $products_id;
                $userPro           = UsersProducts::where('id', $products_id)->first();
                $form->products_id = $userPro->products_id;
                if ($form->num > $userPro->available) {
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

                $user->assets       += $loss;
                $user->profit_loss  += $loss;
                $user->market_value -= $market;
                $user->updated_at   = date('Y-m-d H:i:s');
                $user->save();

                // 扣减可用数量
                $userPro->available -= $form->num;
                $userPro->save();

                $lastNum   = UsersProducts::where('uid', $form->uid)
                    ->where('products_id', $form->products_id)
                    ->where('type', 1)
                    ->orderBy('id', 'desc')
                    ->select('available')
                    ->get();
                $available = 0;
                foreach ($lastNum as $v) {
                    $available += $v->available;
                }
                $form->surplus      = $available;
                $form->loss         = $loss;
                $form->loss_percent = number_format($loss / $market * 100, 3) . '%';

            } else {
                $lastNum = UsersProducts::where('uid', $form->uid)
                    ->where('products_id', $form->products_id)
                    ->orderBy('id', 'desc')
                    ->select('surplus')
                    ->first();
                if (!empty($lastNum)) {
                    $form->surplus = $form->num + $lastNum->surplus;
                } else {
                    $form->surplus = $form->num;
                }
                $form->available = $form->num;
                $form->loss      = 0;
                $price           = $form->price * $form->num;
                Users::where('id', $form->uid)->increment(
                    'market_value',
                    $price
                );
            }
        });

        $form->saved(function (Form $form) {
            // 平均价
            $userPro = $form->model();
            if ($userPro->type == 1) {
                $avgArr = UsersProducts::where('id', '<', $userPro->id)
                    ->where('type', $userPro->type)
                    ->where('uid', $userPro->uid)
                    ->where('products_id', $userPro->products_id)
                    ->select('price', 'num')
                    ->get();
                $num    = $userPro->num;
                $avg    = $userPro->price * $userPro->num;
                if (empty(count($avgArr))) {
                    $avg = ($userPro->price * $userPro->num) / $userPro->num;
                } else {
                    foreach ($avgArr as $k => $val) {
                        $num += $val->num;
                        $avg += $val->price * $val->num;
                    }
                    $avg = $avg / $num;
                }
                $newUserPro      = UsersProducts::find($userPro->id);
                $newUserPro->avg = $avg;
                $newUserPro->save();
            }
            // 更新用户商品总资产
            $user                     = Users::where('id', $userPro->uid)->first();
            $newUserPro               = UsersProducts::find($userPro->id);
            $newUserPro->assets       = $user->assets;
            $newUserPro->market_value = $user->market_value;
            $newUserPro->surplus_cash = $user->assets - $user->market_value;
            $newUserPro->save();
        });
        $form->ignore('pro');

        $form->footer(function ($footer) {
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
        });
        return $form;
    }

    public function userPro(Request $request)
    {
        $id = $request->get('q');

        $userPro = UsersProducts::query()
            ->where('uid', $id)
            ->where('type', 1)
            ->where('available', '>', 0)
            ->get();

        foreach ($userPro as $k => $pro) {
            $data[$k]['id'] = $pro->id;
            // if ($pro->price >= 1000) {
            //     $price = number_format($pro->price / 10000, 1) . 'w';
            // }
            $data[$k]['text'] = $pro->products->name . '-' . $pro->products->no_name .
                ' - 买入单价:' . $pro->price . ' - 剩余可用:' . $pro->available;
        }
        return $data;
    }
}
