<?php
/**
 * Created by PhpStorm.
 * Author: zwe
 * Date: 2020/7/2
 * Time: 12:02
 */

namespace App\Http\Controllers\Api;

use App\Libraries\Tool;
use App\Models\Users;
use App\Models\UsersProducts;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class CommonController extends BaseController
{
    public function login()
    {
        $username = $this->params['username'] ?? '';
        $password = $this->params['password'] ?? '';

        if (empty($username) || empty($password)) {
            return Tool::show(Tool::code('none'), '用户名或密码缺失');
        }

        // 验证用户是否存在
        $users = Users::query()->where('username', $username)->first();

        if (empty($users)) {
            return Tool::show(Tool::code('none'), '用户不存在');
        }

        // 验证密码
        if ($users->password !== md5(env('ADMIN_KEY') . $password)) {
            return Tool::show(Tool::code('none'), '密码错误');
        }

        // 记录缓存
        $token              = md5(env('ADMIN_KEY') . $users->id);
        $expire_time        = 3600 * 6;
        $data['token_info'] = [
            'uid'         => $users->id,
            'token'       => $token,
            'expire_time' => $expire_time
        ];
        Cache::put('users:' . $users->id, $token, $expire_time);

        // 返回首页数据
        $data['users'] = [
            'assets'       => $users->assets,
            'profit_loss'  => $users->profit_loss,
            'market_value' => $users->market_value,
            'surplus'      => $users->assets - abs($users->profit_loss) - $users->market_value,
        ];

        // 商品数量
        $sub_query = UsersProducts::where('uid', $users->id)
            ->where('available', '>', 0)
            ->where('type', 1)
            ->select('id', 'products_id', 'from_id', 'price', 'num', 'surplus', 'available', 'avg', 'loss_percent', 'loss')
            ->orderBy('id', 'desc')
            ->limit(5);

        $userPro = UsersProducts::select('*')
            ->from(DB::raw('(' . $sub_query->toSql() . ') as a'))//from() 类似与 DB::table(), toSql()得到带 ? 号的执行 sql 语句
            ->mergeBindings($sub_query->getQuery())//mergeBindings() 合并绑定参数,getQuery()获得具体值
            ->groupBy('products_id')
            ->orderBy('id', 'desc')
            ->get();

        foreach ($userPro as &$pro) {
            $pro->no_name = $pro->products->no_name;
            $pro->name    = $pro->products->name;
            $price        = str_replace('￥', '', $pro->products->ref_price);
            if (stripos($price, '万') !== false) {
                $price *= 10000;
            }

            // 现价
            $pro->ref_price = $price;

            $pros   = UsersProducts::where('uid', $users->id)
                ->where('available', '>', 0)
                ->where('products_id', $pro->products_id)
                ->where('type', 1)
                ->get();
            $loss   = $loss_percent = $num = $available = 0;
            $fromId = [];
            foreach ($pros as $v) {
                $num       += $v->num;
                $available += $v->available;
                array_push($fromId, $v->id);
            }
            $isShell = UsersProducts::whereIn('from_id', $fromId)->get();

            $noPro = UsersProducts::where('uid', $users->id)
                ->where('available', '>', 0)
                ->where('products_id', $pro->products_id)
                ->where('type', 1)
                ->orderBy('id', 'desc')
                ->first();
            // 成本
            $avg          = $noPro->avg;
            $loss         = number_format($avg - $price, 2);
            $loss_percent = number_format(($avg - $price) / $avg, 2) . '%';

            // 没有交易记录
            if (!empty(count($isShell))) {
                $num = $noPro->surplus;
            }

            $pro->p_num          = $num;
            $pro->p_avg          = $avg;
            $pro->p_available    = $available;
            $pro->p_loss         = $loss;
            $pro->p_loss_percent = $loss_percent;

            unset($pro->products, $pro->products_id, $pro->from_id, $pro->loss,
                $pro->price, $pro->num, $pro->surplus, $pro->available, $pro->avg, $pro->loss_percent
            );
        }
        $data['pro'] = $userPro;

        return Tool::show(Tool::code('ok'), '登录成功', $data);
    }
}