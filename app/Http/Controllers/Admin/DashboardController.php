<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use App\Models\Checkin;
use App\Models\SubscriptionPlan;
use App\Models\User;
use App\Models\Payment;
use App\Models\UserSubscription;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
   public function index()
{
    $userCount = User::count();
    $activeSubscriptions = UserSubscription::where('is_active', true)->count();
    $activeSubscribers = User::where('is_paid', true)->count();
    $revenue = UserSubscription::sum('price');
    $gymCount = Gym::count();
    $todayCheckins = Checkin::whereDate('checkin_time', Carbon::today())->count();
    $recentUsers = User::latest()->take(5)->get();
    $recentActivities = $this->getRecentActivities();

    // ===== Chart Data Start =====
    $usersChartRaw = $this->getMonthlyUserRegistrations();
    $revenueChartRaw = $this->getMonthlyRevenue();
    $checkinsChartRaw = $this->getDailyCheckins();

    $usersChart = [
        'labels' => array_keys($usersChartRaw),
        'data' => array_values($usersChartRaw),
    ];

    $revenueChart = [
        'labels' => array_keys($revenueChartRaw),
        'data' => array_values($revenueChartRaw),
    ];

    $checkinsChart = [
        'labels' => array_keys($checkinsChartRaw),
        'data' => array_values($checkinsChartRaw),
    ];
    // ===== Chart Data End =====

    return view('admin.dashboard', compact(
        'userCount', 
        'activeSubscriptions', 
        'revenue', 
        'gymCount',
        'recentUsers',
        'recentActivities',
        'activeSubscribers',
        'todayCheckins',
        'usersChart',
        'revenueChart',
        'checkinsChart'
    ));
}


    protected function getRecentActivities()
    {
        $activities = [];
        
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

        // No need to sort by diffForHumans (not timestamp), this was causing bugs.
        usort($activities, function ($a, $b) {
            return strtotime($b['time']) - strtotime($a['time']);
        });

        return array_slice($activities, 0, 4);
    }

protected function getMonthlyUserRegistrations()
{
    $users = User::select(DB::raw("COUNT(*) as count"), DB::raw("MONTHNAME(created_at) as month"))
        ->whereYear('created_at', now()->year)
        ->groupBy(DB::raw("MONTH(created_at)"), DB::raw("MONTHNAME(created_at)"))
        ->orderBy(DB::raw("MONTH(created_at)"))
        ->get();

    $result = [];
    foreach ($users as $item) {
        $result[$item->month] = (int) $item->count;
    }

    return $result; // ['Jan' => 120, 'Feb' => 150, ...]
}


    protected function getMonthlyRevenue()
{
    $revenues = UserSubscription::select(DB::raw("SUM(price) as total"), DB::raw("MONTHNAME(created_at) as month"))
        ->whereYear('created_at', now()->year)
        ->groupBy(DB::raw("MONTH(created_at)"), DB::raw("MONTHNAME(created_at)"))
        ->orderBy(DB::raw("MONTH(created_at)"))
        ->get();

    $result = [];
    foreach ($revenues as $item) {
        $result[$item->month] = (float) $item->total;
    }

    return $result; // ['Jan' => 1000, 'Feb' => 1200, ...]
}


    protected function getDailyCheckins()
{
    $checkins = Checkin::select(DB::raw("COUNT(*) as count"), DB::raw("DATE(checkin_time) as date"))
        ->whereBetween('checkin_time', [now()->subDays(6)->startOfDay(), now()->endOfDay()])
        ->groupBy(DB::raw("DATE(checkin_time)"))
        ->orderBy(DB::raw("DATE(checkin_time)"))
        ->get();

    $result = [];
    foreach ($checkins as $item) {
        $formattedDate = Carbon::parse($item->date)->format('M d'); // e.g., "Aug 01"
        $result[$formattedDate] = (int) $item->count;
    }

    return $result; // ['Aug 01' => 5, 'Aug 02' => 8, ...]
}

}
