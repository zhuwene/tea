<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
            // 买入
            if ($model->type == 1) {
                // 市值减少
                // 盈亏减少
                $lossArr = UsersProducts::where('from_id', $model->id)->select('loss')->get();
                $loss    = 0;
                foreach ($lossArr as $v) {
                    $loss += $v->loss;
                }
                $user               = Users::find($model->uid);
                $user->assets       -= $loss;
                $user->profit_loss  -= $loss;
                $user->market_value -= $model->price * $model->available;
                $user->save();
                // 重新计算平均价
                $newAvg = UsersProducts::where('uid', $model->uid)
                    ->where('products_id', $model->products_id)
                    ->where('type', 1)
                    ->where('id', '<>', $model->id)
                    ->orderBy('id', 'asc')
                    ->get();
                foreach ($newAvg as $k => $v) {
                    if ($k == 0) {
                        $avg     = $v->price;
                    } else {
                        $total = $v->price * $v->num;
                        $num   = $v->num;
                        for ($i = 1; $i <= $k; $i++) {
                            $total += $newAvg[$k - $i]['price'] * $newAvg[$k - $i]['num'];
                            $num   += $newAvg[$k - $i]['num'];
                        }
                        $avg     = $total / $num;
                    }
                    UsersProducts::where('id', $v->id)->update([
                        'avg'        => $avg,
                        'updated_at' => date('Y-m-d H:i:s')
                    ]);
                }
                // 删除卖出记录
                UsersProducts::where('from_id', $model->id)->delete();
            } else {
                // 原来剩余增加
                UsersProducts::where('id', $model->from_id)->increment(
                    'available',
                    $model->num,
                    ['updated_at' => date('Y-m-d H:i:s')]
                );
                // 盈亏减掉
                // 市值增加
                $oldPro             = UsersProducts::where('id', $model->from_id)->first();
                $marketValue        = $model->num * $oldPro->price;
                $user               = Users::find($model->uid);
                $user->profit_loss  -= $model->loss;
                $user->assets       -= $model->loss;
                $user->market_value += $marketValue;
                $user->updated_at   = date('Y-m-d H:i:s');
                $user->save();
            }

            $usersPro = UsersProducts::where('uid', $model->uid)
                    ->where('id', '<>', $model->id)
                    ->orderBy('id', 'desc')
                    ->get();
            foreach ($usersPro as $k => $v) {
                if($k == 0) {
                    $v->assets       = $user->assets;
                    $v->surplus_cash = $user->assets - $user->market_value;
                } else {
                    $old = UsersProducts::where('id', $v->id)->select('assets', 'surplus_cash')->first();
                    $v->assets  = $usersPro[$k-1]['assets'] - $old->assets;
                    $firstCash  = $usersPro[$k-1]['surplus_cash'];
                    $firstTotal = $usersPro[$k-1]['num'] * $usersPro[$k-1]['price'];
                    if($firstCash < 0) {
                        $v->surplus_cash = $firstCash + $firstTotal;
                    } else {
                        $v->surplus_cash =  $firstCash - $firstTotal;
                    }
                }
                $v->save();
            }

            // 计算可用数量
            $proSurplus = UsersProducts::where('products_id', $model->products_id)
            ->where('uid',$model->uid)
            ->where('id', '<>', $model->id)
            ->orderBy('id', 'asc')
            ->get();
            foreach ($proSurplus as $k => $v) {
                $surplusPro = UsersProducts::where('id', $v->id)->first();
                if(!empty($k)) {                    
                    if($v->type == 1) {
                        $surplusPro->surplus = $proSurplus[$k-1]['surplus'] + $surplusPro->num;
                    } else {
                        $surplusPro->surplus = $proSurplus[$k-1]['surplus'] - $surplusPro->num;
                    }                   
                } else {
                    $surplusPro->surplus =  $surplusPro->num;
                }
                 $surplusPro->save();
            }

        });
    }
}
