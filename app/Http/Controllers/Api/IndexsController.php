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
use App\Models\Notices;
use App\Models\Searchs;
use App\Models\Users;
use App\Models\UsersCapitals;
use App\Models\UsersProducts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use QL\QueryList;

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

    /**
     * 首页数据
     * @param Request $request
     * @return string
     */
    public function index(Request $request)
    {
        $uid     = $request->header('uid');
        $perPage = $this->params['per_page'] ?? 15;

        if (empty($uid)) {
            return Tool::show(Tool::code('none'), '用户ID参数缺失');
        }

        $users = Users::query()->where('id', $uid)->first();

        // 返回首页数据
        $data['users'] = [
            'assets'       => $users->assets,
            'profit_loss'  => $users->profit_loss,
            'market_value' => $users->market_value,
            'surplus'      => $users->assets - abs($users->profit_loss) - $users->market_value,
        ];

        // 商品数量
        $userPro = UsersProducts::query()
            ->where('uid', $users->id)
            ->where('type', 1)
            ->select('id', 'products_id', 'num', 'available', 'avg')
            ->orderBy('id', 'desc')
            ->groupBy('products_id')
            ->paginate($perPage);

        foreach ($userPro as &$pro) {
            $pro->no_name = $pro->products->no_name;
            $pro->name    = $pro->products->name;
            $price        = str_replace('￥', '', $pro->products->ref_price);
            if (stripos($price, '万') !== false) {
                $price = str_replace('万', '', $price);
                $price *= 10000;
            }

            $pros      = UsersProducts::where('uid', $users->id)
                ->where('products_id', $pro->products_id)
                ->where('type', 1)
                ->get();
            $available = 0;
            foreach ($pros as $v) {
                $available += $v->available;
            }

            $noPro = UsersProducts::where('uid', $users->id)
                ->where('products_id', $pro->products_id)
                ->where('type', 1)
                ->orderBy('id', 'desc')
                ->first();
            // 成本
            $avg          = $noPro->avg;
            $loss         = number_format($avg - $price, 2);
            $loss_percent = number_format(($avg - $price) / $avg, 2) . '%';

            $pro->p_avg          = $avg;
            $pro->p_available    = $available;
            $pro->p_loss         = $loss;
            $pro->p_loss_percent = $loss_percent;
            $pro->p_price        = $price;

            unset($pro->products, $pro->products_id, $pro->num, $pro->available, $pro->avg);
        }
        $data['pro'] = $userPro;

        // 是否有消息
        $isMsg = Notices::query()->where('uid', $users->id)->where('is_read', 0)->count();
        if (empty($isMsg)) {
            $data['is_msg'] = 0;
        } else {
            $data['is_msg'] = 1;
        }

        $searchs           = Searchs::query()->select('name')->get()->toArray();
        $data['hotSearch'] = array_column($searchs, 'name');
        return Tool::show(Tool::code('ok'), 'ok', $data);
    }
}