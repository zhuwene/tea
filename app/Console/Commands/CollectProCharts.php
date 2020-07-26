<?php

namespace App\Console\Commands;

use App\Libraries\Tool;
use App\Models\Products;
use App\models\ProductsDetails;
use Illuminate\Console\Command;

class CollectProCharts extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'collect:proCharts';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '采集商品详细走势图数据';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function dejson($str)
    {
        $str = str_replace("\\", '\\\\', $str);
        $str = str_replace("\r\n", '\n', $str);
        return json_decode($str, 1);
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $pros  = Products::query()->select('goods_id')->get();
        $url   = env('COLLECT_PRODUCTS_PRICE');
        $today = date('Ymd');
        foreach ($pros as $pro) {
            $params = [
                'id'   => $pro->goods_id,
                'bday' => strtotime("$today -30 day"),
                'eday' => strtotime($today)
            ];

            $res = Tool::curl($url, 'POST', $params);

            $res = json_decode(str_replace("\\", '', urldecode(str_replace("%EF%BB%BF", '', urlencode($res)))), 1);

            if (!isset($res['result'])) {
                continue;
            }

            $data = $res['result'];

            foreach ($data as $v) {
                $hasDetail = ProductsDetails::query()
                    ->where('goods_id', $pro->goods_id)
                    ->where('created_at', $v[0])
                    ->first();
                if (count($hasDetail) > 0) {
                    $hasDetail->update_at = date('Y-m-d H:i:s');
                }

                ProductsDetails::insert([
                    'goods_id'      => $pro->goods_id,
                    'ref_price'     => empty($v[1]) ? '' : $v[1],
                    'futures_price' => empty($v[2]) ? '' : $v[2],
                    'created_at'    => $v[0],
                    'updated_at'    => date('Y-m-d H:i:s')
                ]);

            }
        }
    }
}
