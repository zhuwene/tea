<?php

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware(['chkAuth'])->group(function () {
    Route::get('/sys/logs', 'UsersProductsController@logs');
    Route::get('/sys/capital', 'UsersCapitalsController@index');
    Route::get('/sys/getMsg', 'NoticesController@getMsg');
    Route::get('/sys/msgDetail', 'NoticesController@msgDetail');
    Route::get('/sys/index', 'IndexsController@index');
    Route::get('/sys/updateMsg', 'IndexsController@updateMsg');
});
Route::post('/sys/login', 'CommonController@login');
Route::get('/sys/trendChart', 'ProductsController@index');
Route::get('/sys/indexChart', 'IndexsController@list');
Route::get('/sys/proDetail', 'ProductsController@proDetail');

