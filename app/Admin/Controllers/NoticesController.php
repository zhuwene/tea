<?php

namespace App\Admin\Controllers;

use App\Models\Notices;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\Users;

class NoticesController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Notices';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Notices());

        $grid->column('id', __('Id'));
        $grid->column('users.username', __('用户账号'));
        $grid->column('msg', __('消息内容'))->display(function($msg){
            $msg = strip_tags($msg);
            $msg=preg_replace('/\n/is','',$msg);
            $msg = mb_substr($msg, 0, 50).'...';
            return $msg;
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));
         // 禁止新建按钮
        $grid->disableCreateButton();
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
        $show = new Show(Notices::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('users.username', __('用户账号'));
        $show->file('msg', __('消息内容'));
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
        $form = new Form(new Notices());

        $form->select('uid', __('用户账号'))->rules('required', [
            'required' => '用户账号不能为空',
        ])->options(
            Users::query()->pluck('username', 'id')
        );
        $form->editor('msg');

        return $form;
    }
}
