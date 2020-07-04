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
        $uid     = $request->header('uid');
        $perPage = $this->params['per_page'] ?? 15;

        if (empty($uid)) {
            return Tool::show(Tool::code('none'), '用户ID参数缺失');
        }

        $notices = Notices::query()->where('uid', $uid)->paginate($perPage);

        foreach ($notices as $v) {
            $v->is_read = 1;
            $v->save();
            // 去掉html标签
            $subject = strip_tags($v->msg);
            // 去掉空格
            $content = preg_replace('/\s/', '', $subject);
            // 截取50个汉字
            $v->msg = mb_substr($content, 0, 50, 'UTF-8') . '...';
        }
        return Tool::show(Tool::code('ok'), 'ok', $notices);
    }

    public function msgDetail()
    {
        $id = $this->params['id'] ?? 0;

        if (empty($id)) {
            return Tool::show(Tool::code('none'), 'ID参数缺失');
        }

        $notices = Notices::query()->where('id', $id)->first();

        return Tool::show(Tool::code('ok'), 'ok', $notices);
    }
}