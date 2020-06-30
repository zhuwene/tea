<?php

namespace App\Admin\Controllers;

use App\Models\Indexs;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Layout\Content;
use Encore\Admin\Widgets\Box;

class HomeController extends AdminController
{
    public function index(Content $content)
    {
        return $content
            ->header('折线图')
            ->body(new Box('Bar chart', view('admin.chartjs')));
    }

    public function getData()
    {
        //获得该时间段内所有日期列表
//        for ($i = strtotime(date('Ymd')); $i <= 7; $i -= 86400) {
//            $ThisDate = date("Y-m-d", $i);
//            print $ThisDate . '<br/>';
//        }

//        return $end_date = date('Y-m-d', strtotime("20200630 -7 day"));
        $start = '20200601';
        $end   = '20200610';
        $date  = $this->getDateRange($start, $end);
        $arr   = Indexs::where('created_at', '>=', $start)->where('created_at', '<=', $end)->get();
        foreach ($arr as $v) {
            $data['day'][]   = explode(' ', $v->created_at)[0];
            $data['value'][] = $v->index;
        }
        return $data;
    }

    /**
     * @param $startdate
     * @param $enddate
     * @return array
     */
    public function getDateRange($startdate, $enddate)
    {
        $stimestamp = strtotime($startdate);
        $etimestamp = strtotime($enddate);
        // 计算日期段内有多少天
        $days = ($etimestamp - $stimestamp) / 86400 + 1;
        // 保存每天日期
        $date = array();
        for ($i = 0; $i < $days; $i++) {
            $date[] = date('Y-m-d', $stimestamp + (86400 * $i));
        }
        return $date;
    }
}
