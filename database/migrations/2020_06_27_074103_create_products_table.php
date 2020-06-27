<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('no_name', 20)->default(0)->comment('序号名称');
            $table->string('name', 50)->default('')->comment('商品名称');
            $table->smallInteger('goods_id')->default(0)->comment('商品ID');
            $table->string('ref_price', 20)->default('')->comment('参考价');

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
        Schema::dropIfExists('products');
    }
}
