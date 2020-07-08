<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\UsersCapitals;

class UsersProducts extends Model
{
    public function users()
    {
        return $this->belongsTo(Users::class, 'uid');
    }

    public function products()
    {
        return $this->belongsTo(Products::class);
    }

    /**
     * 删除
     *
     * @return // NO
     */
    public static function boot()
    {
        parent::boot();

        static::deleted(function ($model) {
            // 删除卖出记录
            UsersProducts::where('from_id', $model->id)->delete();
            UsersProducts::where('id',$model->id)->delete();

            // 计算可用余额
            $usersPro = UsersProducts::where('uid', $model->uid)
                    ->where('id', '<>', $model->id)
                    ->orderBy('id', 'asc')
                    ->get();
            
            //初始总资金
            $userCap = UsersCapitals::where('uid', $model->uid)->get();
            $userCapCash = 0;

            if(!empty(count($userCap))) {
                foreach ($userCap as $k => $v) {
                    if($v->type == 1) {
                        $userCapCash += $v->price;
                    } else {
                        $userCapCash -= $v->price;
                    }
                }
            }  

            if(empty(count($usersPro))) { 
                $assets       = $userCapCash;
                $market_value = 0;
                $profit_loss  = 0;
            } else {
                foreach ($usersPro as $k => $v) {
                    if(empty($k)) {
                        $v->assets       = $userCapCash;
                        $v->market_value = $v->price * $v->num;
                        $v->loss         = 0;
                        $v->surplus_cash = $v->assets - $v->market_value;
                        $v->surplus      = $v->num;
                        $v->available    = $v->num;
                        $v->avg          = $v->price; 
                    } else {
                        $firstPro = UsersProducts::where('uid', $model->uid)
                                    ->where('id', '<>', $model->id)
                                    ->where('id', '<', $v->id)
                                    ->orderBy('id', 'desc')
                                    ->first();
                        // 可用数量
                        $surplusPro = UsersProducts::where('uid', $model->uid)
                                        ->where('id', '<>', $model->id)
                                        ->where('id', '<',  $v->id)
                                        ->where('products_id', $v->products_id)
                                        ->orderBy('id', 'desc')
                                        ->first();
                        $avgPro    = UsersProducts::where('uid', $model->uid)
                                        ->where('id', '<>', $model->id)
                                        ->where('id', '<',  $v->id)
                                        ->where('products_id', $v->products_id)
                                        ->where('type', 1)
                                        ->get();                   
                        // 剩余可用
                        $availablePro = UsersProducts::where('id', $v->from_id)->first();

                        // 买入
                        if($v->type == 1) {
                            $v->assets       = $firstPro->assets;
                            $v->market_value = $v->price * $v->num + $firstPro->market_value;
                            $v->loss         = 0;
                            if(empty($surplusPro)) {
                                $v->surplus = $v->num;
                            } else {
                                $v->surplus =  $surplusPro->surplus +  $v->num;  
                            }
                            
                            $v->available    = $v->num; 

                            $avgNum = 0;
                            $total  = 0;

                            if(!empty(count($avgPro))) {
                                foreach ($avgPro as $k2 => $v2) {
                                    $avgNum += $v2->num; 
                                    $total  += $v2->num * $v2->price;
                                }   
                                $v->avg = ($total + $v->price * $v->num) / ($avgNum + $v->num);
                            } else {
                                $v->avg = $v->price;
                            }
                            
                       } else {
                            $oldPro = UsersProducts::where('id', $v->from_id)->first();
                            if(empty($oldPro)) {
                                $oldPrice = $model->price;
                            } else {
                                $oldPrice = $oldPro->price;
                                $oldPro->available -=$v->num;
                                $oldPro->save();
                            }
                           
                            $loss   = ($v->price * $v->num)-($oldPrice * $v->num);
                            $v->assets = $firstPro->assets + $loss;
                            $v->loss   = $loss;
                            $v->loss_percent = number_format(($loss / ($oldPrice * $v->num)) * 100, 3).'%';

                            $v->market_value  = $firstPro->market_value - $oldPrice * $v->num;
                            if(empty($surplusPro)) {
                                $v->surplus = $v->num;
                            } else {
                                $v->surplus = $surplusPro->surplus -  $v->num;  
                            }
                            $name = $k .'$v->price:'.$oldPrice;
                            file_put_contents('cc.txt',$name.PHP_EOL, FILE_APPEND);
                            $v->available    = 0;
                            $v->avg = 0;
                       }
                       $v->surplus_cash = $v->assets - $v->market_value;
                    }
                    $v->save();
                }
            }
            
            file_put_contents('dd.txt', '1'.PHP_EOL, FILE_APPEND); 
            // 更新总表
            $userPro = UsersProducts::where('uid', $model->uid)
                                ->where('id', '<>', $model->id)
                                ->orderBy('id', 'asc')
                                ->get();
            $userProNum = count($userPro);
            $userLoss = 0;
            if(!empty($userProNum)) {
                foreach ($userPro as $k3 => $v3) {
                    $userLoss += $v3->loss;
                }
            }            

            $users      = Users::where('id', $model->uid)->first();
            if(!empty(count($usersPro))) {
                $userProAll = $userPro[count($userPro) -1];
                $assets       = $userProAll->assets;
                $market_value = $userProAll->market_value;
                $profit_loss  = $userLoss;
            }   

            $users->assets       = $assets;
            $users->market_value = $market_value;
            $users->profit_loss  = $userLoss;         
            $users->save();
        });
    }
}
