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
        });;
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));
        // 关闭操作
        $grid->disableActions();
        // 禁止新建按钮
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableColumnSelector();
        return $grid;
    }
}
