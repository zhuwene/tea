<?php

namespace App\Libraries;

class Tool
{
    public static function curl($url, $method = 'GET', $data = null, $https = true)
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


    public static function code($key)
    {
        $arr = ['none' => 0, 'ok' => 200, 'forbidden' => 403];
        return $arr[$key];
    }

    public static function show(int $code, string $msg, $data = [])
    {
        $returnData = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data
        ];

        return json_encode($returnData);
    }
}