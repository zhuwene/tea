<?php

namespace App\Console\Commands;

use App\Models\Products;
use Illuminate\Console\Command;
use QL\QueryList;

class Collect extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'collect:products';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '采集商品数据';

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
            'name'     => ['.dh1 a', 'text'],
            'price'    => ['.dh3', 'text'],
            'goods_id' => ['.dh1 a', 'href'],
            'up'       => ['.dh4', 'text'],
            'percent'  => ['.dh5', 'text'],
        ];
        $range = '.quotes_item li';

        for ($i = 1; $i <= 50; $i++) {
            $url  = env('COLLECT_PRODUCTS') . $i;
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
                $product = new Products();
                $res     = $product->where('goods_id', $goodsId)->count();
                $ql      = QueryList::get(env('COLLECT_PRODUCTS_DETAIL') . $goodsId);
                $content = $ql->find('#goodsdiv');
                $content->find('h1,.com_lists,.blank15,.refer_online,.blank20,.gcollect,.share,script,.blank,.goods_pj_right,#indicatorTotal')->remove();
                $contentHtml = $content->html();

                $contents = env('PRODUCT_STYLE') . '<div id="goodsdiv">' . $contentHtml . '</div>';
                if (!empty($res)) {
                    $product->where('goods_id', $goodsId)->update([
                        'ref_price'  => $list['price'],
                        'up'         => $list['up'],
                        'percent'    => $list['percent'],
                        'content'    => $contents,
                        'updated_at' => date('Y-m-d H:i:s')
                    ]);
                    continue;
                }
                $product->content   = $contents;
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
