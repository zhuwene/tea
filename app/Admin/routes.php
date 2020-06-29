<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
    'as'         => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('users', UsersController::class);
    $router->resource('products', ProductsController::class);
    $router->resource('users-products', UsersProductsController::class);
    $router->resource('users-capitals', UsersCapitalsController::class);
    $router->resource('notices', NoticesController::class);
    $router->get('userAccount', 'UsersCapitalsController@userAccount');
    $router->get('userPro', 'UsersProductsController@userPro');

});
