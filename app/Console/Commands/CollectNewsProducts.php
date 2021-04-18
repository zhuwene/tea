<?php

namespace App\Console\Commands;

use App\Models\NewsProducts;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;
use QL\QueryList;

class CollectNewsProducts extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'collects:newsProducts';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '采集新品行情';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $rules  = [
            'name'     => ['.goodsItem_title a', 'text'],
            'price'    => ['.goodsItem_refer .shop_s3', 'text'],
            'goods_id' => ['.goodsItem_title a', 'href'],
            'up'       => ['.goodsItem_up span:eq(0)', 'text'],
            'percent'  => ['.goodsItem_up span:eq(1)', 'text'],
            'img'      => ['.goodsItem_img img', 'src'],
        ];
        $range  = '.categorybox .goodsItem';
        $domain = env('COLLECT_HOST');
        for ($i = 1; $i <= 5; $i++) {
            $url  = env('COLLECT_NEW_PRODUCTS') . $i;
            $data = QueryList::get($url)
                ->rules($rules)
                ->range($range)
                ->query()
                ->getData()
                ->all();
            dd($url);
            foreach ($data as $list) {
                $goodsId  = (int)str_replace('goods.php?id=', '', $list['goods_id']);
                $listName = explode(' ', $list['name']);
                if (count($listName) > 1) {
                    $noName = $listName[0];
                    $name   = $listName[1];
                } else {
                    $noName = '';
                    $name   = $listName[0];
                }

                // 图片
                $img = '';
                if (!empty($list['img'])) {
                    if (stripos($list['img'], '../') !== false) {
                        $imgName = str_replace('../', '', $list['img']);
                        $imgUrl  = $domain . $imgName;
                        try {
                            $source  = file_get_contents($imgUrl);
                            $putFile = Storage::disk('admin')->put($imgName, $source);
                            if ($putFile) {
                                $img = $imgName;
                            }
                        } catch (\Exception $e) {

                        }
                    } else {
                        $img = $list['img'];
                    }
                }

                $product = new NewsProducts();
                $res     = $product->where('goods_id', $goodsId)->select('img_path')->first();
                $ql      = QueryList::get(env('COLLECT_PRODUCTS_DETAIL') . $goodsId);
                $content = $ql->find('#goodsdiv');
                $content->find('h1,.com_lists,.blank15,.refer_online,.blank20,.gcollect,.share,script,.blank,.goods_pj_right,#indicatorTotal')->remove();
                $contentHtml = $content->html();

                $contents = env('PRODUCT_STYLE') . '<div id="goodsdiv">' . $contentHtml . '</div>';
                if (!empty($res)) {
                    $update = [
                        'ref_price'  => $list['price'],
                        'up'         => $list['up'],
                        'percent'    => $list['percent'],
                        'content'    => $contents,
                        'updated_at' => date('Y-m-d H:i:s')
                    ];
                    if (empty($res->img_path)) {
                        $update['img_path'] = $img;
                    }
                    $product->where('goods_id', $goodsId)->update($update);
                    continue;
                }
                $product->content   = $contents;
                $product->img_path  = $img;
                $product->no_name   = $noName;
                $product->name      = $name;
                $product->goods_id  = $goodsId;
                $product->ref_price = $list['price'];
                $product->up        = $list['up'];
                $product->percent   = $list['percent'];
                $product->save();
            }
        }
    }
}
