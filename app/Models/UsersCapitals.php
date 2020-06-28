<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersCapitals extends Model
{
    public function getTypeAttribute($key)
    {
        $arr = [1 => '转入', 2 => '转出'];
        return $arr[$key];
    }

    public function users()
    {
        return $this->belongsTo(Users::class, 'uid');
    }
}
