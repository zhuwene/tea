<?php

namespace App\Admin\Controllers;

use App\Models\UsersProducts;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UsersProductsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'UsersProducts';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UsersProducts());

        $grid->column('id', __('Id'));
        $grid->column('uid', __('Uid'));
        $grid->column('products_id', __('Products id'));
        $grid->column('price', __('Price'));
        $grid->column('type', __('Type'));
        $grid->column('num', __('Num'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show->field('uid', __('Uid'));
        $show->field('products_id', __('Products id'));
        $show->field('price', __('Price'));
        $show->field('type', __('Type'));
        $show->field('num', __('Num'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

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

        $form->number('uid', __('Uid'));
        $form->number('products_id', __('Products id'));
        $form->number('price', __('Price'));
        $form->switch('type', __('Type'));
        $form->number('num', __('Num'));

        return $form;
    }
}
