<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersCapitals extends Model
{
    public function users()
    {
        return $this->belongsTo(Users::class, 'uid');
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
            // 转入
            $user = Users::find($model->uid);
            if ($model->type == 1) {
                $user->assets -= $model->price;
            } else {
                $user->assets += $model->price;
            }
            $user->save();
            $userCap = UsersCapitals::where('id', '<>', $model->id)
                ->where('uid', $model->uid)
                ->orderBy('id', 'desc')
                ->get();
            if (!$userCap->isEmpty()) {
                foreach ($userCap as $k => $v) {
                    if (empty($k)) {
                        $v->balance = $user->assets - $user->market_value;
                    } else {
                        $v->balance = $userCap[$k - 1]['balance'] - $userCap[$k - 1]['price'];
                    }
                    $v->save();
                    $userCap[$k]['balance'] = $v->balance;
                }
            }
        });
    }
}
