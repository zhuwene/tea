<?php
/**
 * Created by PhpStorm.
 * Author: zwe
 * Date: 2020/7/2
 * Time: 12:02
 */

namespace App\Http\Controllers\Api;

use App\Libraries\Tool;
use App\Models\Notices;
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
        $expire_time        = 86400 * 7;
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
        $userPro = UsersProducts::query()
            ->where('uid', $users->id)
            ->where('type', 1)
            ->select('id', 'products_id', 'num', 'available', 'avg')
            ->orderBy('id', 'desc')
            ->groupBy('products_id')
            ->paginate(15);

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
        return Tool::show(Tool::code('ok'), '登录成功', $data);
    }
}