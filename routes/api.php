<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\Admin;
use App\Http\Controllers\Admin\Customers;
use App\Http\Controllers\Admin\Game;
use App\Http\Controllers\Admin\Wallet;
use App\Http\Controllers\Admin\Notification;
use App\Http\Controllers\Admin\Result;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


