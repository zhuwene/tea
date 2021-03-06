<?php
/**
 * Created by PhpStorm.
 * Author: zwe
 * Date: 2020/7/2
 * Time: 12:02
 */

namespace App\Http\Controllers\Api;

use App\Libraries\Tool;
use App\Models\Banners;
use App\Models\Indexs;
use App\Models\Notices;
use App\Models\Products;
use App\Models\Searchs;
use App\Models\Users;
use App\Models\UsersCapitals;
use App\Models\UsersProducts;
use App\Models\NewsProducts;
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


        $data['indexs'] = Indexs::query()
            ->where('created_at', '>=', $beginTime)
            ->where('created_at', '<=', $endTime)
            ->select('index', 'price', 'percent', 'created_at')
            ->orderBy('created_at', 'desc')
            ->paginate($perPage);

        $data['charts'] = Indexs::query()
            ->where('created_at', '>=', $beginTime)
            ->where('created_at', '<=', $endTime)
            ->select('index', 'price', 'percent', 'created_at')
            ->orderBy('created_at', 'asc')
            ->get();

        return Tool::show(Tool::code('ok'), 'ok', $data);
    }

    /**
     * 交易首页数据
     * @param Request $request
     * @return string
     */
    public function transIndex(Request $request)
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
            'surplus'      => $users->assets  - $users->market_value,
        ];

        // 商品数量
        $userPro = UsersProducts::query()
            ->where('uid', $users->id)
            ->where('type', 1)
            ->where('available', '>', 0)
            ->select('id', 'products_id', 'num', 'available', 'avg')
            ->orderBy('id', 'desc')
            ->groupBy('products_id')
            ->paginate($perPage);

        foreach ($userPro as &$pro) {
            $pro->no_name  = $pro->products->no_name;
            $pro->name     = $pro->products->name;
            $pro->goods_id = $pro->products->goods_id;
            $pro->id       = $pro->products->id;
            $price         = str_replace('￥', '', $pro->products->ref_price);
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
            $totalC       = $avg * $available;
            $totalP       = $price * $available;
            $loss         = number_format($totalP - $totalC, 2);
            $loss_percent = number_format(($totalP - $totalC) / $totalC * 100, 2) . '%';

            $pro->p_avg          = $avg;
            $pro->p_available    = $available;
            $pro->p_loss         = $loss;
            $pro->p_loss_percent = $loss_percent;
            $pro->p_price        = $price;

            unset($pro->products, $pro->products_id, $pro->num, $pro->available, $pro->avg);
        }
        $data['pro'] = $userPro;

        return Tool::show(Tool::code('ok'), 'ok', $data);
    }

    /**
     * 首页数据
     * @param Request $request
     * @return string
     */
    public function index()
    {
        $data['pro'] = Products::query()
            ->select('id', 'goods_id', 'no_name', 'name', 'ref_price', 'up', 'percent')
            ->orderBy('updated_at', 'desc')
            ->limit(10)
            ->get();
        $banners     = Banners::query()->select('id', 'title', 'img_path')->get();
        foreach ($banners as $v) {
            $v->img_path = env('APP_URL') . '/upload/' . $v->img_path;
        }
        $data['banners'] = $banners;
        return Tool::show(Tool::code('ok'), 'ok', $data);
    }

    public function test()
    {
        // set_time_limit(60);
        // $url = 'https://zhaocha.yf-gz.cn/zzc/wx/tea/hot?sid=ccaaf17812a791f19b3fac3cf2dcb98e&page=1&pageSize=180000&name=&year=&productionTechnology=';

        // $res = json_decode(Tool::curl($url), 1);
        // $data = $res['data'];

        // foreach ($data as $v) {
        //     $pro = NewsProducts::where('goods_id', $v['goodsId'])->first();
        //     if(!empty($pro)) {
        //         $pro->img_path = $v['img1'];
        //         $pro->save();
        //     }

        // }
        $pro = NewsProducts::get();
        foreach ($pro as $key => $value) {
            if (!empty($value->img_path)) {
                $value->img_path = explode('?', $value->img_path)[0];
                $value->save();
            }
        }
    }
}