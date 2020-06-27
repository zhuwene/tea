<?php

namespace App\Admin\Controllers;

use App\Models\UsersProducts;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\Users;
use App\Models\Products;

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
        $grid = new Grid(new UsersProducts());

        $grid->column('id', __('Id'));
        $grid->column('users.username', __('用户账号'));
        $grid->column('products.name', __('商品名称'));
        $grid->column('price', __('价格'))->display(function($price){
            if($price >= 1000) {
                $price = number_format($price / 10000, 1) . 'w';
            }
            return $price;
        });
        $grid->column('type', __('类型'));
        $grid->column('num', __('数量'));
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('修改时间'));

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
        );
        $form->select('products_id', __('商品名称'))->options(
            Products::query()->pluck('name', 'id')
        );
         $form->select('type', __('类型'))->options(['买入', '卖出']);
        $form->number('price', __('金额'));
        $form->number('num', __('数量'));
        
         // 保存前回调
        $form->saving(function (Form $form) {
            // 卖出
            if($form->type) {
               Users::where('id', $form->uid)->increment(
                    'assets',
                    $form->price * $form->num
                );  
            } else {
                Users::where('id', $form->uid)->decrement(
                    'assets', 
                    $form->price * $form->num,
                    ['updated_at'=>date('Y-m-d H:i:s')]
                );
                Users::where('id', $form->uid)->increment(
                    'market_value',
                    $form->price * $form->num
                );                
            }
        });

        return $form;
    }
}
