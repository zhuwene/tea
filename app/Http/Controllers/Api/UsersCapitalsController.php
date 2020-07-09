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
use App\Models\UsersCapitals;
use App\Models\UsersProducts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UsersCapitalsController extends BaseController
{
    public function index(Request $request)
    {
        $perPage = $this->params['per_page'] ?? 15;
        $uid     = $request->header('uid');

        if (empty($uid)) {
            return Tool::show(Tool::code('none'), '用户ID参数缺失');
        }

        $userCap = UsersCapitals::query()->where('uid', $uid)->orderBy('id', 'desc')->paginate($perPage);

        foreach ($userCap as &$pro) {
            if ($pro->type == 1) {
                $pro->type = '转入';
            } else {
                $pro->type = '转出';
            }

            unset($pro->uid, $pro->updated_at);
        }
        return Tool::show(Tool::code('ok'), 'ok', $userCap);
    }
}