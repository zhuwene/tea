<?php
/**
 * Created by PhpStorm.
 * Author: zwe
 * Date: 2020/7/2
 * Time: 12:02
 */

namespace App\Http\Controllers\Api;

use App\Libraries\Tool;
use App\Models\Indexs;
use App\Models\Users;
use App\Models\UsersCapitals;
use App\Models\UsersProducts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class IndexsController extends BaseController
{
    public function list()
    {
        $perPage = $this->params['per_page'] ?? 15;
        $type    = $this->params['type'] ?? 2;

        $now = time();
        switch ($type) {
            case 0:
                $beginTime = date('Y-m-d', strtotime('-30 day'));
                $endTime   = date('Y-m-d');
                break;
            case 1:
                $time      = strtotime('-2 month', $now);
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0, 0, date('m', $time), 1, date('Y', $time)));
                $endTime   = date('Y-m-d 23:39:59', mktime(0, 0, 0, date('m', $now), date('t', $now), date('Y', $now)));
                break;
            case 2:
                $time      = strtotime('-5 month', $now);
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0, 0, date('m', $time), 1, date('Y', $time)));
                $endTime   = date('Y-m-d 23:39:59', mktime(0, 0, 0, date('m', $now), date('t', $now), date('Y', $now)));
                break;
            case 3:
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0, 0, 1, 1, date('Y', $now)));
                $endTime   = date('Y-m-d 23:39:59', mktime(0, 0, 0, 12, 31, date('Y', $now)));
                break;
            case 4:
                $time      = strtotime('-2 year', $now);
                $beginTime = date('Y-m-d 00:00:00', mktime(0, 0, 0, 1, 1, date('Y', $time)));
                $endTime   = date('Y-m-d 23:39:59', mktime(0, 0, 0, 12, 31, date('Y')));
                break;
        }


        $indexsData = Indexs::query()
            ->where('created_at', '>=', $beginTime)
            ->where('created_at', '<=', $endTime)
            ->select('index', 'price', 'percent', 'created_at')
            ->paginate($perPage);

        return Tool::show(Tool::code('ok'), 'ok', $indexsData);
    }
}