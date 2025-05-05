<?php


use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\GymApiController;
use App\Http\Controllers\Api\PlanApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Authenticated routes (Sanctum protected)
Route::middleware('auth:sanctum')->group(function () {
    // User related routes
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    
  
});

  // Plans routes with API resource naming conventions
  Route::prefix('plans')->group(function () {
    Route::get('/', [PlanApiController::class, 'index'])->name('api.plans.index');
    Route::get('/{plan}', [PlanApiController::class, 'show'])->name('api.plans.show');
    Route::get('/{plan}/features', [PlanApiController::class, 'features'])->name('api.plans.features');
    
    // If you need protected routes for creating/updating plans
    // Route::post('/', [PlanApiController::class, 'store'])->middleware('can:create_plans');
    // Route::put('/{plan}', [PlanApiController::class, 'update'])->middleware('can:edit_plans');
});


Route::prefix('gyms')->group(function () {
    Route::get('/', [GymApiController::class, 'index']);
    Route::get('/{id}', [GymApiController::class, 'show']);
});