<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersCapitals extends Model
{
    public function getTypeAttribute($key)
    {
        $arr = ['转入', '转出'];
        return $arr[$key];
    }

    public function users()
    {
        return $this->belongsTo(users::class, 'uid');
    }
}
