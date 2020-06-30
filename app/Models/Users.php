<?php
/**
 * Created by PhpStorm.
 * Author: zwe
 * Date: 2020/6/27
 * Time: 15:32
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Users extends Model
{
    public function capitals()
    {
        return $this->hasMany(UsersCapitals::class);
    }

    public function products()
    {
        return $this->hasMany(UsersProducts::class);
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
            UsersCapitals::where('uid', $model->id)->delete();
            UsersProducts::where('uid', $model->id)->delete();
            Notices::where('uid', $model->id)->delete();
        });
    }
}