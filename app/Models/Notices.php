<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notices extends Model
{
    public function users()
    {
        return $this->belongsTo(Users::class, 'uid');
    }
}
