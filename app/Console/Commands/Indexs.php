<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Indexs as IndexsM;

class Indexs extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'collect:indexs';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '采集指数';

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
        $url = 'https://www.baijiafutea.com/Ajax/ListEchar.aspx';
        $res = json_decode($this->curl($url), 1);

        foreach ($res as $v) {
            $chk = IndexsM::where('item_id', $v['ItemId'])->count();
            if ($chk) {
                continue;
            }
            IndexsM::insert([
                'item_id'    => $v['ItemId'] ?? 0,
                'index'      => $v['OIndex'] ?? '',
                'price'      => $v['UpPrice'] ?? 'null',
                'percent'    => $v['UpPerson'] ?? '0%',
                'created_at' => $v['IDate'] ?? '',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
        }
    }

    public function curl($url, $method = 'GET', $data = null, $https = true)
    {
        $method = strtoupper($method);
        $ch     = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        if ($https) {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }
        if ($method == "POST") {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        }
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
}
