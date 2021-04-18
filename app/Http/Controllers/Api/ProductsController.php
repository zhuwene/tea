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
use App\Models\ProductsDetails;
use App\Models\Searchs;

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
            ->select('id', 'goods_id', 'no_name', 'name', 'ref_price', 'up', 'percent')
            ->where($where)
            ->paginate($perPage);

        foreach ($pros as &$pro) {
            $pro->percent = str_replace(' ', '', $pro->percent);
        }
        $data['pro'] = $pros;

        $searchs           = Searchs::query()->select('name')->orderBy('id', 'desc')->get()->toArray();
        $data['hotSearch'] = array_column($searchs, 'name');

        return Tool::show(Tool::code('ok'), 'ok', $data);
    }

    public function proDetail()
    {
        $id = $this->params['id'] ?? 0;

        if (empty($id)) {
            return Tool::show(Tool::code('none'), '商品ID参数缺失');
        }

        $pro = Products::query()->where('id', $id)->select('no_name', 'name', 'content', 'img_path')->first();

        if (stripos($pro->img_path, 'https://') === false &&
            stripos($pro->img_path, 'http://') === false
        ) {
            $pro->img_path = env('APP_URL') . '/upload/' . $pro->img_path;
        }
        return Tool::show(Tool::code('ok'), 'ok', $pro);
    }

    public function teaMarket()
    {
        $where   = [];
        $perPage = $this->params['per_page'] ?? 15;

        $pros = Products::query()
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

    public function goodsCharts()
    {
        $where     = [];
        $goodsId   = $this->params['goods_id'] ?? 0;
        $startTime = $this->params['start_time'] ?? 0;
        $endTime   = $this->params['end_time'] ?? 0;

        if (empty($goodsId)) {
            return Tool::show(Tool::code('none'), '商品ID参数缺失');
        }

        if (!empty($startTime)) {
            array_push($where, ['created_at', '>=', $startTime]);
        }

        if (!empty($endTime)) {
            array_push($where, ['created_at', '<=', $endTime]);
        }
        $limit  = 500;
        $colunm = 'id';
        $sort   = 'asc';
        if (empty($startTime) && empty($endTime)) {
            $limit  = 30;
            $colunm = 'id';
            $sort   = 'desc';
        }

        $detail = ProductsDetails::query()
            ->where('goods_id', $goodsId)
            ->select('ref_price', 'futures_price', 'created_at')
            ->where($where)
            ->orderBy($colunm, $sort)
            ->limit($limit)
            ->get()
            ->toArray();

        if (empty($startTime) && empty($endTime)) {
            $detail = array_reverse($detail);
        }

        return Tool::show(Tool::code('ok'), 'ok', $detail);
    }
}