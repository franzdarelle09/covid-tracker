<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/users',[UsersController::class,'index']);
Route::get('/login',[UsersController::class,'login'])->name('login');
Route::post('/login',[UsersController::class,'checkLogin']);
Route::get('/business-details/{link}', [BusinessController::class, 'businessDetails'])->name('business.details');
Route::post('/business-details', [BusinessController::class, 'saveBusinessDetails']);
Route::middleware(['auth'])->group(function(){
    Route::get('/',[BusinessController::class,'index'])->name('business');
    Route::get('/business/profile/{id}/{date?}',[BusinessController::class,'profile']);
    Route::get('/logout',[UsersController::class,'signout']);
    Route::resource('/business', BusinessController::class);
});