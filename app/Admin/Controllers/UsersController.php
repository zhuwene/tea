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

        $grid->column('id', __('Id'));
        $grid->column('username', __('用户账号'));
        $grid->column('assets', __('总资产'))->display(function ($price) {
            if ($price >= 1000) {
                $price = number_format($price / 10000, 2) . 'w';
            }
            return $price;
        });
        $grid->column('profit_loss', __('总盈亏'))->display(function ($price) {
            if (abs($price) >= 1000) {
                $price = number_format($price / 10000, 2) . 'w';
            }
            return $price;
        });;
        $grid->column('market_value', __('总市值'))->display(function ($price) {
            if ($price >= 1000) {
                $price = number_format($price / 10000, 1) . 'w';
            }
            return $price;
        });
        $grid->column('surplus_cash', __('可用资金'))->display(function () {
            $price = $this->assets - $this->market_value - abs($this->profit_loss);
            if ($price >= 1000) {
                $price = number_format($price / 10000, 2) . 'w';
            }
            return $price;
        });
        $grid->column('account', __('银行账号'));
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('修改时间'));
        $grid->disableExport();
        $grid->disableColumnSelector();

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

        $show->field('id', __('Id'));
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

        $form->ignore(['password_confirmation']);
        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = md5(env('ADMIN_KEY') . $form->password);;
            }
        });

        return $form;
    }
}
