<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Libraries\Tool;
use App\Models\Banners;
use App\Models\NewsProducts;
use App\Models\Products;
use Illuminate\Http\Request;
use QL\QueryList;

class BannersController extends BaseController
{
    public function detail()
    {
        $id = $this->params['id'] ?? 0;

        if (empty($id)) {
            return Tool::show(Tool::code('none'), 'banner ID参数缺失');
        }
        $banners = Banners::query()->where('id', $id)->first();
        return Tool::show(Tool::code('ok'), 'ok', $banners);
    }
}
