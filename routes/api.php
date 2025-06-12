 <?php

    use App\Http\Controllers\Api\AuthController;
    use App\Http\Controllers\Api\EnrollController;
    use App\Http\Controllers\Api\FavoriteGymController;
    use App\Http\Controllers\Api\GymApiController;
    use App\Http\Controllers\Api\GymOwnerController;
    use App\Http\Controllers\Api\PlanApiController;
    use App\Http\Controllers\Api\UserApiController;
    use App\Http\Controllers\Api\PaymentConfirmationController;
    use App\Http\Controllers\Api\StripePaymentController;
    use Illuminate\Http\Request;
    use Illuminate\Support\Facades\Route;

    // Public routes
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/gym-login', [AuthController::class, 'gymLogin']);

    // Email OTP routes (Fixed method names)
    Route::post('/send-email-otp', [AuthController::class, 'sendEmailOtp']);
    Route::post('/reset-password-with-email', [AuthController::class, 'resetPasswordWithEmail']);
    Route::post('/verify-otp', [AuthController::class, 'verifyOtp']);
    Route::post('/verify-reset-otp', [AuthController::class, 'verifyResetOtp']);

    // Authenticated routes (Sanctum protected)
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/user', function (Request $request) {
            return $request->user();
        });

        Route::post('/logout', [AuthController::class, 'logout']);
    });

    // Plans routes
    Route::prefix('plans')->group(function () {
        // Get all active plans (basic info)
        Route::get('/', [PlanApiController::class, 'index']);

        // Get detailed plan with features and gyms
        Route::get('/{plan}', [PlanApiController::class, 'show']);

        // Get only features of a specific plan
        Route::get('/{plan}/features', [PlanApiController::class, 'features']);

        // Optional: Get only gyms of a specific plan
        Route::get('/{plan}/gyms', [PlanApiController::class, 'gyms']);
    });

    // Gyms routes
    Route::prefix('gyms')->group(function () {
        // Public routes
        Route::get('/', [GymApiController::class, 'index']);
        Route::get('/{id}', [GymApiController::class, 'show']);
        Route::get('/nearby', [GymApiController::class, 'nearby']);
        Route::get('/popular', [GymApiController::class, 'popular']);


        // Protected routes (require authentication)
        Route::middleware('auth:sanctum')->group(function () {
            Route::post('/', [GymApiController::class, 'store']);
            Route::post('/{id}/update', [GymApiController::class, 'update']);
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




    Route::middleware('auth:sanctum')->group(function () {
        // Profile routes
        Route::prefix('profile')->group(function () {
            Route::get('/', [UserApiController::class, 'getProfile']);
            Route::post('/', [UserApiController::class, 'updateProfile']);
        });
    });


    Route::middleware('auth:sanctum')->group(function () {
    // Simple notification routes
    Route::get('/notifications', [GymOwnerController::class, 'getNotifications']);
    Route::post('/notifications/mark-read', [GymOwnerController::class, 'markNotificationsRead']);
});

    Route::post('/create-payment-intent', [StripePaymentController::class, 'createPaymentIntent']);
    Route::post('/confirm-payment', [PaymentConfirmationController::class, 'confirmPayment']);



    // enrollment

    Route::post('/enroll', [EnrollController::class, 'enroll'])->middleware('auth:sanctum');
    Route::get('/enrollments', [EnrollController::class, 'getEnrollments'])->middleware('auth:sanctum');
