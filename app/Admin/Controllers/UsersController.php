<?php

namespace App\Admin\Controllers;

use App\Models\Users;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UsersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用戶';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Users());

        $grid->column('id', __('序号'));
        $grid->column('username', __('用户账号'));
        $grid->column('name', __('用户名称'));
        $grid->column('assets', __('总资产'));
        $grid->column('profit_loss', __('总盈亏'));
        $grid->column('market_value', __('总市值'));
        $grid->column('surplus_cash', __('可用资金'))->display(function () {
            return $this->assets - $this->market_value - abs($this->profit_loss);
        });
        $grid->column('account', __('银行账号'));
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('修改时间'));
        $grid->disableExport();
        $grid->disableColumnSelector();

        $grid->filter(function ($filter) {
            // 用户账号
            $user = Users::pluck('username', 'id');
                // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) use ($user) {
                $filter->in('uid', '用户账号')->multipleSelect($user);
            });
             $filter->column(1/2, function ($filter) use ($user) {
                $filter->like('name','用户昵称');

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
        $show = new Show(Users::findOrFail($id));

        $show->field('id', __('序号'));
        $show->field('username', __('用户账号'));
        $show->field('assets', __('总资产'));
        $show->field('profit_loss', __('总盈亏'));
        $show->field('market_value', __('总市值'));
        $show->field('account', __('银行账号'));
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
        $form = new Form(new Users());

        $form->text('username', __('用户账号'))->creationRules(['required', "unique:users"])
            ->updateRules(['required', "unique:users,username,{{id}}"]);
        $form->password('password', __('密码'))->rules('required|confirmed', [
            'required'  => '密码不能为空',
            'confirmed' => '两次密码不一致'
        ]);
        $form->password('password_confirmation', __('确认密码'))->rules('required', [
            'required' => '确认密码不能为空',
        ])
            ->default(function ($form) {
                return $form->model()->password;
            });
        $form->text('name', __('用户昵称'))->rules('max:20', [
            'max'  => '最大长度20',
        ]);
        // $form->text('account', __('银行账号'));
        $form->ignore(['password_confirmation']);
        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = md5(env('ADMIN_KEY') . $form->password);
            }
        });

        return $form;
    }
}
