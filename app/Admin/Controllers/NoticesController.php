<?php

namespace App\Admin\Controllers;

use App\Models\Notices;
use App\Models\UsersProducts;
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
    protected $title = '消息';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Notices());

        $grid->column('id', __('序号'));
        $grid->column('users.username', __('用户账号'));
        $grid->column('users.name', __('用户昵称'));
        $grid->column('msg', __('消息内容'))->display(function ($msg) {
            // 去掉html标签
            $subject = strip_tags($msg);
            // 去掉空格
            $content = preg_replace('/\s/', '', $subject);
            // 截取50个汉字
            $msg = mb_substr($content, 0, 50, 'UTF-8') . '...';
            return $msg;
        });
        $grid->column('is_read', __('是否已读'))->display(function ($type) {
            if ($type == 0) {
                return '否';
            } else {
                return '是';
            }
        });;
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));
        // 禁止新建按钮
        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->actions(function ($actions) {
            // 去掉查看
            $actions->disableView();
        });

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
        $show = new Show(Notices::findOrFail($id));

        $show->field('id', __('序号'));
        $show->field('users.username', __('用户账号'));
        $show->field('msg', __('消息内容'));
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
        $form->tools(function (Form\Tools $tools) {
            // 去掉`查看`按钮
            $tools->disableView();
        });

        return $form;
    }
}
