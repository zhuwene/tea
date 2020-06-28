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

    public function getTypeAttribute($key)
    {
        $arr = [1 => '买入', 2 => '卖出'];
        return $arr[$key];
    }
}
