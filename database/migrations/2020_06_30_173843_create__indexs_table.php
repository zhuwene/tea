<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIndexsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('indexs', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('item_id')->default(0)->comment('原数据ID');
            $table->string('index', 15)->default('')->comment('指数');
            $table->string('price', 10)->default('')->comment('涨跌额');
            $table->string('percent', 10)->default('')->comment('涨跌幅');
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
        Schema::dropIfExists('_indexs');
    }
}
