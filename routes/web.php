<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\GymController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\UserSubscriptionController;
use App\Http\Controllers\Admin\PaymentController;
use App\Http\Controllers\Admin\PlanController;
use App\Http\Controllers\HomeController;

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

// Public Welcome Page
Route::get('/', function () {
    return redirect("/login");
});

// Authentication Routes
Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'login']);
    
    Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
    Route::post('/register', [RegisterController::class, 'register']);
});

Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

// Admin Protected Routes
Route::prefix('admin')
    ->middleware(['auth', 'admin'])
    ->name('admin.')
    ->group(function () {
        // Dashboard
        Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
        
        // Resource Routes
        Route::resources([
            'users' => UserController::class,
            'gyms' => GymController::class,
            'payments' => PaymentController::class,
            'plans' => PlanController::class,
            'user-subscriptions' => UserSubscriptionController::class,
        ]);

        // Plan Features Routes
        Route::prefix('plans/{plan}')->group(function () {
            Route::get('features/create', [PlanController::class, 'createFeature'])
                ->name('plans.features.create');
            Route::post('features', [PlanController::class, 'storeFeature'])
                ->name('plans.features.store');
            Route::get('features/{feature}/edit', [PlanController::class, 'editFeature'])
                ->name('plans.features.edit');
            Route::put('features/{feature}', [PlanController::class, 'updateFeature'])
                ->name('plans.features.update');
            Route::delete('features/{feature}', [PlanController::class, 'destroyFeature'])
                ->name('plans.features.destroy');
            Route::get('features', [PlanController::class, 'showPlanWithFeatures'])
                ->name('plans.showWithFeatures');
              
        });
    });

// Home Route
Route::middleware('auth')->get('/home', [HomeController::class, 'index'])->name('home');