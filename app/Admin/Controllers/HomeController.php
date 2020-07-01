<?php

namespace App\Admin\Controllers;

use App\Models\Indexs;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Box;
use Encore\Admin\Grid;
use App\Admin\Extensions\Tools\HomeGender;
class HomeController extends AdminController
{
     /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '指数';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Indexs());
        $gender = \Request::get('gender') ?? 2;

        $grid->header(function ($query) {            
            $arr   = Indexs::where('created_at', '>=', date('Y-m-d',strtotime('-10 day')))->where('created_at', '<=', date('Y-m-d'))->get();
            foreach ($arr as $v) {
                $indexData['labels'][]   = explode(' ', $v->created_at)[0];
                $indexData['value'][] = $v->index;
            }
           $labelsCount = count($indexData['labels']) - 1;
            $index = view('admin.chart.index', compact('indexData', 'labelsCount'));

            return new Box('指数', $index);
        });

        $grid->column('created_at', __('日期'))->display(function($day){
            return explode(' ', $day)[0];
        });
        $grid->column('index', __('指数'));
        $grid->column('price', __('涨跌额'))->display(function ($percent) {
            if (stripos($percent, '-') !== false) {
                $str = "<span style='color:green'>{$percent}</span>";
            } else {
                $str = "<span style='color:red'>{$percent}</span>";
            }
            return $str;
        });;
        $grid->column('percent', __('涨跌幅'))->display(function ($percent) {
            if (stripos($percent, '-') !== false) {
                $str = "<span style='color:green'>{$percent}</span>";
            } else {
                $str = "<span style='color:red'>{$percent}</span>";
            }
            return $str;
        });;

        $grid->disableCreateButton();
        $grid->disableExport();

        $grid->disableColumnSelector();
        $grid->disableRowSelector();
        $grid->disableActions(); 
        $grid->disableFilter();   
        $now = time();
        switch ($gender) {
            case 0:
                $beginTime = date('Y-m-d',strtotime('-30 day'));
                $endTime = date('Y-m-d');
                break;
            case 1:
                $time = strtotime('-2 month', $now);
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0,0, date('m', $time), 1, date('Y', $time)));
                $endTime = date('Y-m-d 23:39:59', mktime(0, 0, 0, date('m', $now), date('t', $now), date('Y', $now)));
                break;
            case 2:
                $time = strtotime('-5 month', $now);
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0,0, date('m', $time), 1, date('Y', $time)));
                $endTime = date('Y-m-d 23:39:59', mktime(0, 0, 0, date('m', $now), date('t', $now), date('Y', $now)));
            break;
            case 3:
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0,0, 1, 1, date('Y', $now)));
                $endTime = date('Y-m-d 23:39:59', mktime(0, 0, 0, 12, 31, date('Y', $now)));
            break;
            case 4:
                $time = strtotime('-2 year', $now);
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0, 0, 1, 1, date('Y', $time)));
                $endTime = date('Y-m-d 23:39:59', mktime(0, 0, 0, 12, 31, date('Y')));
            break;
        }
        $grid->model()->where('created_at', '>=', $beginTime)->where('created_at', '<=', $endTime)->orderby('created_at','desc');
        $grid->filter(function($filter){

        });
        $grid->tools(function ($tools) {
            $tools->append(new HomeGender());
        });
        return $grid;        
    }
}
