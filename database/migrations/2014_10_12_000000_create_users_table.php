<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('username',25)->default('')->comment('用户名');
            $table->char('password', 32)->default('')->comment('密码');
            $table->integer('assets')->default(0)->comment('总资产');
            $table->integer('profit_loss')->default(0)->comment('总盈亏');
            $table->integer('market_value')->default(0)->comment('总市值');
            $table->string('account',500)->default('')->comment('账号 多个逗号');

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
        Schema::dropIfExists('users');
    }
}
