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
            ->paginate($perPage);

        return Tool::show(Tool::code('ok'), 'ok', $pros);
    }

    public function proDetail()
    {
        $id = $this->params['id'] ?? 0;

        if (empty($id)) {
            return Tool::show(Tool::code('none'), '商品ID参数缺失');
        }

        $pro = Products::query()->where('id', $id)->select('no_name', 'name', 'content','img_path')->first();

        return Tool::show(Tool::code('ok'), 'ok', $pro);
    }
}
