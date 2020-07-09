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
use App\Models\Searchs;
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

        return Tool::show(Tool::code('ok'), '登录成功', $data);
    }
}