<?php

namespace App\Admin\Controllers;

use App\Models\Banners;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Storage;

class BannersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '轮播图';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Banners());

        $grid->column('id', __('序号'));
        $grid->column('title', __('标题'));
        $grid->column('img_path', __('图片'))->image(env('APP_URL').'/upload/', 50, 50);
        $grid->column('content', __('详细内容'))->display(function ($msg) {
            // 去掉html标签
            $subject = strip_tags($msg);
            // 去掉空格
            $content = preg_replace('/\s/', '', $subject);
            if(strlen($content) < 50) {
                return $content;
            } else {
                // 截取50个汉字
                return mb_substr($content, 0, 50, 'UTF-8') . '...';
            }
        });
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
                $filter->like('title', '标题名称');
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
        $show = new Show(Banners::findOrFail($id));

        $show->field('id', __('序号'));
        $show->field('title', __('标题'));
        $show->field('img_path', __('图片'));
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
        $form = new Form(new Banners());

        $form->text('title', __('标题'))->rules('required|max:20',[
            'required' => '标题不能为空',
            'max'      => '标题不能超过20个字'
        ]);
        $form->image('img_path', __('图片'))->rules('required',[
            'required' => '请上传图片',
        ]);
        $form->UEditor('content',__('详细内容'));
        return $form;
    }
}
