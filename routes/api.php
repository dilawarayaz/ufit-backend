 <?php
 use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\FavoriteGymController;
use App\Http\Controllers\Api\GymApiController;
use App\Http\Controllers\Api\PlanApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Email OTP routes (Fixed method names)
Route::post('/send-email-otp', [AuthController::class, 'sendEmailOtp']);
Route::post('/reset-password-with-email', [AuthController::class, 'resetPasswordWithEmail']);
Route::post('/verify-otp', [AuthController::class, 'verifyOtp']);
// Authenticated routes (Sanctum protected)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::post('/logout', [AuthController::class, 'logout']);
});

// Plans routes
Route::prefix('plans')->group(function () {
    Route::get('/', [PlanApiController::class, 'index'])->name('api.plans.index');
    Route::get('/{plan}', [PlanApiController::class, 'show'])->name('api.plans.show');
    Route::get('/{plan}/features', [PlanApiController::class, 'features'])->name('api.plans.features');
});

// Gyms routes
Route::prefix('gyms')->group(function () {
    // Public routes
    Route::get('/', [GymApiController::class, 'index']);
    Route::get('/{id}', [GymApiController::class, 'show']);
    Route::post('/', [GymApiController::class, 'store']);
    
    // Protected routes (require authentication)
    Route::middleware('auth:api')->group(function () {
        Route::put('/{id}', [GymApiController::class, 'update']);
        Route::patch('/{id}', [GymApiController::class, 'update']);
        Route::delete('/{id}', [GymApiController::class, 'destroy']);
        
        // Admin-only routes
        Route::middleware('admin')->group(function () {
            Route::get('/pending', [GymApiController::class, 'pendingGyms']);
            Route::post('/{id}/approve', [GymApiController::class, 'approveGym']);
            Route::post('/{id}/reject', [GymApiController::class, 'rejectGym']);
        });
    });
});


Route::middleware('auth:sanctum')->group(function () {
    Route::post('gyms/{gymId}/favorite', [FavoriteGymController::class, 'favorite']);
    Route::delete('gyms/{gymId}/favorite', [FavoriteGymController::class, 'unfavorite']);
    Route::get('my-favorite-gyms', [FavoriteGymController::class, 'myFavorites']);
});