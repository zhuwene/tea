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
        $grid->column('price', __('涨跌额'));
        $grid->column('percent', __('涨跌幅'));

        $grid->disableCreateButton();
        $grid->disableExport();

        $grid->disableColumnSelector();
        $grid->disableRowSelector();
        $grid->disableActions();    
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
    // public function index(Content $content)
    // {
    //     return $content
    //         ->header('折线图')
    //         ->body(new Box('Bar chart', view('admin.chartjs')));
    // }

    // public function getData()
    // {
    //     $start = '20200601';
    //     $end   = '20200610';
    //     $date  = $this->getDateRange($start, $end);
    //     $arr   = Indexs::where('created_at', '>=', $start)->where('created_at', '<=', $end)->get();
    //     foreach ($arr as $v) {
    //         $data['day'][]   = explode(' ', $v->created_at)[0];
    //         $data['value'][] = $v->index;
    //     }
    //     return $data;
    // }

    // /**
    //  * @param $startdate
    //  * @param $enddate
    //  * @return array
    //  */
    // public function getDateRange($startdate, $enddate)
    // {
    //     $stimestamp = strtotime($startdate);
    //     $etimestamp = strtotime($enddate);
    //     // 计算日期段内有多少天
    //     $days = ($etimestamp - $stimestamp) / 86400 + 1;
    //     // 保存每天日期
    //     $date = array();
    //     for ($i = 0; $i < $days; $i++) {
    //         $date[] = date('Y-m-d', $stimestamp + (86400 * $i));
    //     }
    //     return $date;
    // }
}
