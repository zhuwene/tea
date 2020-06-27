<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UsersProducts extends Model
{
    public function users()
    {
        return  $this->belongsTo(users::class);
    }

    public function products()
    {
        return  $this->belongsTo(Products::class);
    }
}
