<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
//
Route::get('object', 'ObjectController@listAllObjects');
Route::get('object/{id}', 'ObjectController@findById');
Route::get('object/objecttoreuse/{id}', 'ObjectController@findByObjects');
Route::get('object/material/{id}', 'ObjectController@findByMaterial');
Route::get('object/skill', 'ObjectController@listForSkill');
Route::get('objecttoreuse', 'ObjectToReuseController@findAll');
Route::get('objecttoreuse/{id}', 'ObjectToReuseController@findById');
Route::get('material', 'MaterialController@findAll');
Route::get('material/{id}', 'MaterialController@findById');