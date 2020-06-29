<?php

namespace App\Admin\Controllers;

use App\Models\Products;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use QL\QueryList;

class ProductsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '商品';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Products());

        $grid->column('id', __('Id'));
        $grid->column('goods_id', __('商品ID'));
        $grid->column('no_name', __('序号名称'));
        $grid->column('name', __('商品名称'));
        $grid->column('ref_price', __('参考价'));
        $grid->column('up', __('升跌'))->display(function ($up) {
            if (stripos($up, '↓') !== false) {
                $str = "<span style='color:green'>{$up}</span>";
            } else {
                $str = "<span style='color:red'>{$up}</span>";
            }
            return $str;
        });
        $grid->column('percent', __('升跌幅'))->display(function ($percent) {
            if (stripos($percent, '↓') !== false) {
                $str = "<span style='color:green'>{$percent}</span>";
            } else {
                $str = "<span style='color:red'>{$percent}</span>";
            }
            return $str;
        });
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));

//        $grid->actions(function ($actions) {
//            $actions->disableDelete();
//        });
        // 禁止新建按钮
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableColumnSelector();
        return $grid;
    }
    public function _handle_action_()
    {
        return 123123;
    }
    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Products::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('no_name', __('序号名称'));
        $show->field('name', __('商品名称'));
        $show->field('goods_id', __('商品ID'));
        $show->field('ref_price', __('参考价'));
        $show->field('up', __('升跌'));
        $show->field('percent', __('升跌幅'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('修改时间'));

        $show->panel()->tools(function ($tools) {
            $tools->disableDelete();
        });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Products());

        $form->text('no_name', __('序号名称'))->disable();
        $form->text('name', __('商品名称'))->disable();
        $form->text('goods_id', __('商品ID'))->disable();
        $form->text('ref_price', __('参考价'))->disable();
        $form->text('up', __('升跌'))->disable();
        $form->text('percent', __('升跌幅'))->disable();

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
        });

        return $form;
    }
}
