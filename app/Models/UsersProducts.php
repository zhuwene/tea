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
            // 转入
            if ($model->type == 1) {
                Users::where('id', $model->uid)->decrement(
                    'assets',
                    $model->price,
                    ['updated_at' => date('Y-m-d H:i:s')]
                );
            } else {
                Users::where('id', $model->uid)->increment(
                    'assets',
                    $model->price,
                    ['updated_at' => date('Y-m-d H:i:s')]
                );
            }


        });
    }
}
