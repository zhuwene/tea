<?php

namespace App\Console\Commands;

use App\Models\NewsProducts;
use Illuminate\Console\Command;
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
        $rules = [
            'name'     => ['.goodsItem_title a', 'text'],
            'price'    => ['.goodsItem_refer .shop_s3', 'text'],
            'goods_id' => ['.goodsItem_title a', 'href'],
            'up'       => ['.goodsItem_up span:eq(0)', 'text'],
            'percent'  => ['.goodsItem_up span:eq(1)', 'text'],
        ];
        $range = '.categorybox .goodsItem';

        for ($i = 1; $i <= 5; $i++) {
            $url  = env('COLLECT_NEW_PRODUCTS') . $i;
            $data = QueryList::get($url)
                ->rules($rules)
                ->range($range)
                ->query()
                ->getData()
                ->all();
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
                $product = new NewsProducts();
                $res     = $product->where('goods_id', $goodsId)->count();
                if (!empty($res)) {
                    $product->where('goods_id', $goodsId)->update(['updated_at' => date('Y-m-d H:i:s')]);
                    continue;
                }
                $ql      = QueryList::get(env('COLLECT_PRODUCTS_DETAIL') . $goodsId);
                $content = $ql->find('#goodsdiv');
                $content->find('h1,.com_lists,.blank15,.refer_online,.blank20,.gcollect,.share,script,.blank,.goods_pj_right,#indicatorTotal')->remove();

                $product->content   = env('PRODUCT_STYLE') . '<div id="goodsdiv">' . $content->html() . '</div>';
                $product->img_path  = '';
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
