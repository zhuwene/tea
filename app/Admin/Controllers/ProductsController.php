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
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));
        // 关闭操作
        $grid->disableActions();
        // 禁止新建按钮
        $grid->disableCreateButton();
        return $grid;
    }
}
