<?php

use App\Http\Controllers\Admin\AnalyticsController;
use App\Http\Controllers\Admin\MarketingToolController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\GymController;
use App\Http\Controllers\Admin\GymEquipmentController;
use App\Http\Controllers\Admin\GymReviewController;
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

        // User Management Routes
        Route::prefix('users')->group(function () {
            // Index - List all users
            Route::get('/', [UserController::class, 'index'])->name('users.index');

            // Create - Show user creation form
            Route::get('/create', [UserController::class, 'create'])->name('users.create');

            // Store - Save new user
            Route::post('/', [UserController::class, 'store'])->name('users.store');

            // Show - Display single user
            Route::get('/{user}', [UserController::class, 'show'])->name('users.show');

            // Edit - Show edit form
            Route::get('/{user}/edit', [UserController::class, 'edit'])->name('users.edit');

            // Update - Save edited user
            Route::put('/{user}', [UserController::class, 'update'])->name('users.update');

            // Your existing special actions
            Route::post('/{user}/suspend', [UserController::class, 'suspend'])->name('users.suspend');
            Route::post('/{user}/reactivate', [UserController::class, 'reactivate'])->name('users.reactivate');
            Route::post('/{user}/change-subscription', [UserController::class, 'changeSubscription'])
                ->name('users.change-subscription');
        });
        Route::get('user-subscriptions/create', [UserSubscriptionController::class, 'create'])->name('admin.user-subscriptions.create');
        Route::post('user-subscriptions', [UserSubscriptionController::class, 'store'])->name('admin.user-subscriptions.store');
        Route::get('user-subscriptions/{id}/edit', [UserSubscriptionController::class, 'edit'])->name('admin.user-subscriptions.edit');
        Route::put('user-subscriptions/{id}', [UserSubscriptionController::class, 'update'])->name('admin.user-subscriptions.update');
        // Resource Routes
        Route::resources([
            'users' => UserController::class,
            'payments' => PaymentController::class,
            'plans' => PlanController::class,
            'user-subscriptions' => UserSubscriptionController::class,
        ]);

        // Gym Management Routes
        Route::prefix('gyms')->group(function () {
            // Main Gym Routes
            Route::get('/', [GymController::class, 'index'])->name('gyms.index');
            Route::get('/create', [GymController::class, 'create'])->name('gyms.create');
            Route::post('/', [GymController::class, 'store'])->name('gyms.store');
            Route::get('/{gym}', [GymController::class, 'show'])->name('gyms.show');
            Route::get('/{gym}/edit', [GymController::class, 'edit'])->name('gyms.edit');
            Route::put('/{gym}', [GymController::class, 'update'])->name('gyms.update');
            Route::delete('/{gym}', [GymController::class, 'destroy'])->name('gyms.destroy');

            // Pending Applications
            Route::get('/pending/view', [GymController::class, 'pendingApplications'])->name('gyms.pending');
            Route::post('/{gym}/approve', [GymController::class, 'approveApplication'])->name('gyms.approve');
            Route::post('/{gym}/reject', [GymController::class, 'rejectApplication'])->name('gyms.reject');

            // Statistics
            Route::get('/{gym}/statistics', [GymController::class, 'showStatistics'])->name('gyms.statistics');

            // Equipment Management
            Route::prefix('/{gym}/equipment')->group(function () {
                Route::get('/', [GymEquipmentController::class, 'index'])->name('gyms.equipment.index');
                Route::get('/create', [GymEquipmentController::class, 'create'])->name('gyms.equipment.create');
                Route::post('/', [GymEquipmentController::class, 'store'])->name('gyms.equipment.store');
                Route::get('/{equipment}/edit', [GymEquipmentController::class, 'edit'])->name('gyms.equipment.edit');
                Route::put('/{equipment}', [GymEquipmentController::class, 'update'])->name('gyms.equipment.update');
                Route::delete('/{equipment}', [GymEquipmentController::class, 'destroy'])->name('gyms.equipment.destroy');
            });

            // Reviews Management
            Route::prefix('/{gym}/reviews')->group(function () {
                Route::get('/', [GymReviewController::class, 'index'])->name('gyms.reviews.index');
                Route::post('/{review}/approve', [GymReviewController::class, 'approve'])->name('gyms.reviews.approve');
                Route::delete('/{review}', [GymReviewController::class, 'destroy'])->name('gyms.reviews.destroy');
            });
        });

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


Route::middleware(['auth', 'admin'])->prefix('admin')->group(function () {
    Route::get('payments', [PaymentController::class, 'index'])->name('admin.payments.index');
    Route::get('payments-export', [PaymentController::class, 'export'])->name('admin.payments-export');
    Route::get('payments/{id}', [PaymentController::class, 'show'])->name('admin.payments.show');
    Route::get('payments/{id}/invoice', [PaymentController::class, 'downloadInvoice'])->name('admin.payments.invoice.download');
    Route::post('payments/stripe/create-payment-intent', [PaymentController::class, 'createStripePayment'])->name('admin.payments.stripe.create');
});





Route::prefix('admin')->middleware(['auth', 'admin'])->group(function () {
    Route::get('analytics', [AnalyticsController::class, 'index'])->name('admin.analytics.index');
    Route::get('analytics/subscription-growth', [AnalyticsController::class, 'subscriptionGrowthTrends'])->name('admin.analytics.subscription-growth');
    Route::get('/analytics/retention-churn', [AnalyticsController::class, 'retentionAndChurn'])->name('admin.analytics.retention-churn');
    Route::get('/analytics/gym-performance', [AnalyticsController::class, 'gymPerformanceComparisons'])->name('admin.analytics.gym-performance');
    Route::get('analytics/region-engagement', [AnalyticsController::class, 'regionBasedUserEngagement'])->name('admin.analytics.region-engagement');
    Route::get('analytics/custom-report', [AnalyticsController::class, 'customReport'])->name('admin.analytics.custom-report');
    Route::post('analytics/custom-report/export', [AnalyticsController::class, 'exportCustomReport'])->name('admin.analytics.custom-report.export');
    Route::get('admin/analytics/export-report', [AnalyticsController::class, 'exportReport'])
        ->name('admin.analytics.export-report');
});

Route::prefix('admin')->middleware(['auth', 'admin'])->group(function () {
    Route::get('email-campaigns', [MarketingToolController::class, 'emailCampaigns'])->name('email-campaigns');
    Route::get('push-notifications', [MarketingToolController::class, 'pushNotifications'])->name('push-notifications');
});

// Home Route
Route::middleware('auth')->get('/home', [HomeController::class, 'index'])->name('home');
