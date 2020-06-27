<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_products', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('uid')->default(0)->comment('用户ID');
            $table->integer('products_id')->default(0)->comment('商品ID');
            $table->integer('price')->default(0)->comment('价格');
            $table->tinyInteger('type')->default(0)->comment('类型 0-买入 1-卖出');
            $table->smallInteger('num')->default(0)->comment('数量');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users_products');
    }
}
