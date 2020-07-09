<?php

namespace App\Admin\Controllers;

use App\Models\Products;
use App\Models\Users;
use App\Models\UsersCapitals;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\MessageBag;

class UsersCapitalsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '资金明细';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UsersCapitals());

        $grid->column('id', __('序号'));
        $grid->column('users.username', __('用户名称'));
        $grid->column('users.name', __('用户昵称'));
        $grid->column('account', __('账号'));
        $grid->column('price', __('金额'));
        $grid->column('balance', __('余额'));
        $grid->column('type', __('类型'))->display(function ($type) {
            if ($type == 1) {
                return '转入';
            } else {
                return '转出';
            }
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));
        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->actions(function ($actions) {
            $actions->disableEdit();
        });
        $grid->model()->orderBy('id', 'desc');

        $grid->filter(function ($filter) {
            // 用户账号
            $user = Users::pluck('username', 'id');
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) use ($user) {
                $filter->in('uid', '用户账号')->multipleSelect($user);

            });

            $filter->column(1 / 2, function ($filter) {
                $filter->in('type', '类型')->multipleSelect([1 => '转入', 2 => '转出']);
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
        $show = new Show(UsersCapitals::findOrFail($id));

        $show->field('id', __('序号'));
        $show->field('users.username', __('用户账号'));
        $show->field('account', __('账号'));
        $show->field('price', __('金额'));
        $show->field('balance', __('余额'));
        $show->field('type', __('类型'))->as(function ($type) {
            if ($type == 1) {
                return '转入';
            } else {
                return '转出';
            }
        });
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new UsersCapitals());

        $form->select('uid', __('用户账号'))->rules('required', [
            'required' => '用户账号不能为空',
        ])->options(
            Users::query()->pluck('username', 'id')
        );

        $form->text('account', __('银行账号'))->rules('required', [
            'required' => '请选择银行账号',
        ]);
        $form->select('type', __('类型'))->options([1 => '转入', 2 => '转出'])->rules('required', [
            'required' => '请选择类型',
        ]);
        $form->number('price', __('金额'))->rules('required', [
            'required' => '请填写金额',
        ]);
        $form->hidden('balance');

        // 保存前回调
        $form->saving(function (Form $form) {
            if ($form->type == 2) {
                $user = Users::find($form->uid);
                if($form->price > $user->assets) {
                    $error = new MessageBag([
                        'title'   => '错误提示',
                        'message' => '转出金额大于总资产!',
                    ]);
                    return back()->with(compact('error'));
                }
                Users::where('id', $form->uid)->decrement(
                    'assets',
                    $form->price,
                    ['updated_at' => date('Y-m-d H:i:s')]
                );
            } else {
                Users::where('id', $form->uid)->increment(
                    'assets',
                    $form->price,
                    ['updated_at' => date('Y-m-d H:i:s')]
                );
            }
            $form->balance = 0;
        });
        $form->saved(function (Form $form) {
            $users             = Users::where('id', $form->model()->uid)->select('assets', 'market_value', 'profit_loss')->first();
            $balance           = $users->assets - $users->market_value - abs($users->profit_loss);
            $usersCap          = UsersCapitals::find($form->model()->id);
            $usersCap->balance = $balance;
            $usersCap->save();
        });
        return $form;
    }

    public function userAccount(Request $request)
    {
        $id      = $request->get('q');
        $users   = users::query()->where('id', $id)->select('id', 'account')->first();
        $account = explode(',', $users->account);
        foreach ($account as $k => $acc) {
            $data[$k]['id']   = $acc;
            $data[$k]['text'] = $acc;
        }
        return $data;
    }
}
