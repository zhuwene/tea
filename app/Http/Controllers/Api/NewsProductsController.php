<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Libraries\Tool;
use App\Models\Banners;
use App\Models\NewsProducts;
use App\Models\Products;
use Illuminate\Http\Request;
use QL\QueryList;

class NewsProductsController extends BaseController
{
    public function newsMarket()
    {
        $where   = [];
        $perPage = $this->params['per_page'] ?? 15;

        $pros = NewsProducts::query()
            ->select('id', 'goods_id', 'img_path', 'no_name', 'name', 'ref_price', 'up', 'percent')
            ->where($where)
            ->orderBy('goods_id', 'desc')
            ->paginate($perPage);

        foreach ($pros as $v) {
            if (stripos($v->img_path, 'https://') !== false ||
                stripos($v->img_path, 'http://') !== false
            ) {
                continue;
            }
            $v->img_path = env('APP_URL') . '/upload/' . $v->img_path;
        }
        return Tool::show(Tool::code('ok'), 'ok', $pros);
    }

    public function proDetail()
    {
        $id = $this->params['id'] ?? 0;

        if (empty($id)) {
            return Tool::show(Tool::code('none'), '商品ID参数缺失');
        }

        $pro = NewsProducts::query()->where('id', $id)->select('no_name', 'name', 'content', 'img_path')->first();
        if (stripos($pro->img_path, 'https://') === false &&
            stripos($pro->img_path, 'http://') === false
        ) {
            $pro->img_path = env('APP_URL') . '/upload/' . $pro->img_path;
        }
        return Tool::show(Tool::code('ok'), 'ok', $pro);
    }
}
