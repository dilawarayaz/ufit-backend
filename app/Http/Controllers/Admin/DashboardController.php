<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use App\Models\SubscriptionPlan;
use App\Models\User;
use App\Models\Payment;
use App\Models\UserSubscription;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index()
    {
        // Get the count of users
        $userCount = User::count();

        // Get the count of active user subscriptions
        $activeSubscriptions = UserSubscription::where('is_active', true)->count();

        // Calculate the total revenue
        $revenue = UserSubscription::sum('price');
        
        $gymCount = Gym::count();

        // Get recent users (last 5)
        $recentUsers = User::latest()->take(5)->get();

        // Generate recent activities
        $recentActivities = $this->getRecentActivities();

        return view('admin.dashboard', compact(
            'userCount', 
            'activeSubscriptions', 
            'revenue', 
            'gymCount',
            'recentUsers',
            'recentActivities'
        ));
    }

    protected function getRecentActivities()
    {
        $activities = [];
        
        // Get recent users
        $recentUsers = User::latest()->take(2)->get();
        foreach ($recentUsers as $user) {
            $activities[] = [
                'icon' => 'user-plus',
                'color' => 'primary',
                'title' => 'New member joined',
                'description' => $user->name,
                'time' => $user->created_at->diffForHumans()
            ];
        }
        
        // Get recent payments
        $recentPayments = Payment::with('user')->latest()->take(2)->get();
        foreach ($recentPayments as $payment) {
            $activities[] = [
                'icon' => 'money-bill-wave',
                'color' => 'success',
                'title' => 'New payment received',
                'description' => '$' . number_format($payment->amount, 2) . ' from ' . $payment->user->name,
                'time' => $payment->created_at->diffForHumans()
            ];
        }
        
        // Get recent subscriptions
        $recentSubscriptions = UserSubscription::with('user')->latest()->take(1)->get();
        foreach ($recentSubscriptions as $subscription) {
            $activities[] = [
                'icon' => 'id-card',
                'color' => 'warning',
                'title' => 'New subscription',
                'description' => $subscription->user->name,
                'time' => $subscription->created_at->diffForHumans()
            ];
        }
        
        // Sort activities by time (newest first)
        usort($activities, function($a, $b) {
            return strtotime($b['time']) - strtotime($a['time']);
        });
        
        // Return only the 4 most recent activities
        return array_slice($activities, 0, 4);
    }
}