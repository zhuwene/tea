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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UsersProductsController extends BaseController
{
    public function logs(Request $request)
    {
        $type    = $this->params['type'] ?? 0;
        $perPage = $this->params['per_page'] ?? 15;
        $uid     = $request->header('uid');

        if (empty($uid)) {
            return Tool::show(Tool::code('none'), '用户ID参数缺失');
        }
        $where = [];
        switch ($type) {
            case 0:
                array_push($where, ['type', '>', 0]);
                break;
            case 1:
                array_push($where, ['type', '=', 1]);
                break;
            case 2:
                array_push($where, ['type', '=', 2]);
                break;
        }

        $userPro = UsersProducts::query()->where('uid', $uid)->where($where)->orderBy('id', 'desc')->paginate($perPage);

        foreach ($userPro as &$pro) {
            if ($pro->type == 1) {
                $pro->type = '买入';
            } else {
                $pro->type = '卖出';
            }
            $pro->no_name  = $pro->products->no_name;
            $pro->name     = $pro->products->name;
            $pro->goods_id = $pro->products->goods_id;
            unset($pro->products, $pro->uid, $pro->products_id, $pro->from_id, $pro->available, $pro->updated_at);
        }
        return Tool::show(Tool::code('ok'), 'ok', $userPro);
    }
}