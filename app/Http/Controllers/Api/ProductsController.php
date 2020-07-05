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
use App\Models\Products;
use App\Models\Users;
use App\Models\UsersCapitals;
use App\Models\UsersProducts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class ProductsController extends BaseController
{
    public function index()
    {
        $where   = [];
        $perPage = $this->params['per_page'] ?? 15;
        $name    = $this->params['name'] ?? '';

        if (!empty($name)) {
            array_push($where, [function ($query) use ($name) {
                $query->where('no_name', 'like', '%' . $name . '%')
                    ->orWhere('name', 'like', '%' . $name . '%');
            }]);
        }

        $indexs             = Indexs::query()
            ->select('index', 'price', 'percent', 'created_at')
            ->orderBy('created_at', 'desc')
            ->first();
        $indexs->created_at = explode(' ', $indexs->created_at)[0];
        $weekarray          = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
        $indexs->week       = $weekarray[date("w", strtotime($indexs->created_at))];
        $data['indexs']     = $indexs;
        $pros               = Products::query()
            ->select('no_name', 'name', 'ref_price', 'up', 'percent')
            ->where($where)
            ->paginate($perPage);

        foreach ($pros as &$pro) {
            $pro->percent = str_replace(' ', '', $pro->percent);
        }
        $data['pro'] = $pros;
        return Tool::show(Tool::code('ok'), 'ok', $data);
    }

    public function proDetail()
    {
        $id = $this->params['id'] ?? 0;

        if (empty($id)) {
            return Tool::show(Tool::code('none'), '商品ID参数缺失');
        }

        $pro = Products::query()->where('id', $id)->select('no_name', 'name', 'content')->first();

        return Tool::show(Tool::code('ok'), 'ok', $pro);
    }
}