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
use App\Models\Users;
use App\Models\UsersCapitals;
use App\Models\UsersProducts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class NoticesController extends BaseController
{
    public function getMsg(Request $request)
    {
        $uid = $request->header('uid');

        if (empty($uid)) {
            return Tool::show(Tool::code('none'), '用户ID参数缺失');
        }

        $notices = Notices::with(['users' => function ($q) {
            $q->select('id', 'username', 'name');
        }])->where('uid', $uid)
            ->first();
        return Tool::show(Tool::code('ok'), 'ok', $notices);
    }
}