<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersCapitalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users_capitals', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('uid')->default(0)->comment('用户ID');
            $table->string('account', 25)->default('')->comment('账号');
            $table->integer('price')->default(0)->comment('金额');
            $table->integer('balance')->default(0)->comment('余额');
            $table->tinyInteger('type')->default(0)->comment('类型 0-转入 1-转出');

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
        Schema::dropIfExists('users_capital');
    }
}
