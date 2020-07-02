<?php

namespace App\Http\Middleware;

use App\Models\SysLog;
use App\Models\SysMenu;
use Closure;
use App\Libraries\Tool;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CheckAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // 登录状态
        $uid   = $request->header('uid');
        $token = $request->header('token');

        if (empty($token) || empty($uid)) {
            echo Tool::show(Tool::code('none'), 'token或uid参数缺失');
            die;
        }

        // 验证token
        if ($token !== md5(env('ADMIN_KEY') . $uid) || !Cache::has('users:' . $uid)) {
            echo Tool::show(Tool::code('error'), '请重新登录');
            die;
        }
        return $next($request);
    }
}
