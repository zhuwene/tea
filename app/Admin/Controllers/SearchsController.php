<?php

namespace App\Admin\Controllers;

use App\Models\Searchs;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SearchsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '搜索';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Searchs());

        $grid->column('id', __('序号'));
        $grid->column('name', __('搜索名称'));
        $grid->column('created_at', __('创建时间'));
        $grid->column('updated_at', __('更新时间'));

        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->model()->orderBy('id', 'desc');

        $grid->filter(function ($filter) {
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->column(1 / 2, function ($filter) {
                $filter->equal('id','序号');
            });

            $filter->column(1 / 2, function ($filter) {
                $filter->like('name', '搜索名称');
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
        $show = new Show(Searchs::findOrFail($id));

        $show->field('id', __('序号'));
        $show->field('name', __('搜索名称'));
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
        $form = new Form(new Searchs());

        $form->text('name', __('搜索名称'))->rules('required', [
            'required' => '请输入搜索名称',
        ]);

        $form->footer(function ($footer) {
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
        });
        return $form;
    }
}
