<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subscription;
use App\Models\User;
use App\Models\Gym;
use App\Models\Region;
use App\Models\CheckIn;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\CustomReportExport;
use App\Models\UserSubscription;

class AnalyticsController extends Controller
{
    /**
     * Display the analytics dashboard
     */
    public function index()
    {
        $growthData = UserSubscription::select(
            DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month"),
            DB::raw("COUNT(*) as total_subscriptions")
        )
            ->groupBy('month')
            ->orderBy('month', 'asc')
            ->get();
        //   dd($growthData);
        return view('admin.analytics.index', compact('growthData'));
    }

    public function retentionAndChurn()
    {
        // Total subscriptions (users who ever subscribed)
        $totalUsers = UserSubscription::distinct('user_id')->count('user_id');

        // Retained users = users who renewed at least once (more than one subscription)
        $retainedUsers = UserSubscription::select('user_id')
            ->groupBy('user_id')
            ->havingRaw('COUNT(*) > 1')
            ->count();

        $retentionRate = $totalUsers > 0 ? round(($retainedUsers / $totalUsers) * 100, 2) : 0;
        $churnRate = 100 - $retentionRate;

        return view('admin.analytics.retention_churn', compact('retentionRate', 'churnRate'));
    }


    public function gymPerformanceComparisons()
    {
        // Get gym performance data (check-ins, subscriptions, etc.)
        $gymPerformance = Gym::withCount(['checkIns', 'userSubscriptions'])
            ->with(['region'])
            ->has('region')
            ->orderBy('check_ins_count', 'desc')
            ->get();

        // Get top performing gyms (by check-ins)
        $topGymsByCheckins = $gymPerformance->take(5);
        //  dd($gymPerformance);
        // Get top performing gyms by subscriptions
        $topGymsBySubscriptions = $gymPerformance->sortByDesc('user_subscriptions_count')->take(5);
        //   dd($topGymsBySubscriptions);
        // Get performance by region
        $regionPerformance = Region::withCount(['checkIns', 'userSubscriptions'])
            ->orderBy('check_ins_count', 'desc')
            ->get();
        // dd($regionPerformance);
        return view('admin.analytics.gym_performance', compact(
            'topGymsByCheckins',
            'topGymsBySubscriptions',
            'regionPerformance',
            'gymPerformance'
        ));
    }


   public function regionBasedUserEngagement()
{
    $regions = Region::withCount(['checkIns', 'userSubscriptions'])
        ->with(['gyms.checkIns','gyms.users' => function ($query) {
            $query->select('users.id');
        }])
        ->get()
        ->map(function ($region) {
            $uniqueUsers = $region->gyms->flatMap(function ($gym) {
                return $gym->checkIns->pluck('id');
            })->unique()->count();

            return [
                'region_name' => $region->name,
                'total_check_ins' => $region->check_ins_count,
                'total_subscriptions' => $region->user_subscriptions_count,
                'unique_users' => $uniqueUsers
            ];
        });

        // dd($regions);

    return view('admin.analytics.region_engagement', compact('regions'));
}



    public function customReport(Request $request)
    {

        // Get filters from request
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');
        $regionId = $request->input('region_id');
        $gymId = $request->input('gym_id');

        // Build query
        $query = UserSubscription::with(['user', 'gym', 'gym.region']);

        if ($startDate && $endDate) {
            $query->whereBetween('created_at', [$startDate, $endDate]);
        }

        if ($regionId) {
            $query->whereHas('gym', function ($q) use ($regionId) {
                $q->where('region_id', $regionId);
            });
        }

        if ($gymId) {
            $query->where('gym_id', $gymId);
        }

        $subscriptions = $query->latest()->get();


        $regions = Region::all();

        $gyms = Gym::all();
        // foreach ($gyms as $value) {
        //     Gym::where('id',$value->id)->update(['region_id'=>rand(1,5)]);
        // }
        // dd($subscriptions);
        return view('admin.analytics.custom_report', compact('subscriptions', 'regions', 'gyms'));
    }

    public function exportCustomReport(Request $request)
    {
        // Get filters from request
        $startDate = $request->input('start_date');
        $endDate = $request->input('end_date');
        $regionId = $request->input('region_id');
        $gymId = $request->input('gym_id');

        // Build query same as customReport method
        $query = UserSubscription::with(['user', 'gym', 'gym.region']);

        if ($startDate && $endDate) {
            $query->whereBetween('created_at', [$startDate, $endDate]);
        }

        if ($regionId) {
            $query->whereHas('gym', function ($q) use ($regionId) {
                $q->where('region_id', $regionId);
            });
        }

        if ($gymId) {
            $query->where('gym_id', $gymId);
        }

        $subscriptions = $query->latest()->get();



        $headers = [
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=custom_report.csv",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        ];

        $columns = ['User', 'Region', 'Gym', 'Subscribed At'];

        $callback = function () use ($subscriptions, $columns) {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns); // Column headers

            foreach ($subscriptions as $subscription) {
                fputcsv($file, [
                    $subscription->user->name ?? 'N/A',
                    $subscription->gym && $subscription->gym->region ? $subscription->gym->region->name : 'N/A',
                    $subscription->gym ? $subscription->gym->name : 'N/A',
                    $subscription->created_at->format('Y-m-d H:i:s'),
                ]);
            }

            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }
    public function subscriptionGrowthTrends(Request $request)
    {
        $period = $request->input('period', 'monthly');
        $range = $request->input('range', 6); // default: last 6 months

        $growthData = collect();

        if ($period === 'daily') {
            $growthData = UserSubscription::select(
                DB::raw("DATE(created_at) as date"),
                DB::raw("COUNT(*) as count"),
                DB::raw("SUM(price) as revenue")
            )
                ->where('created_at', '>=', Carbon::now()->subMonths($range))
                ->groupBy('date')
                ->orderBy('date')
                ->get();
        } elseif ($period === 'weekly') {
            $growthData = UserSubscription::select(
                DB::raw("YEAR(created_at) as year"),
                DB::raw("WEEK(created_at) as week"),
                DB::raw("COUNT(*) as count"),
                DB::raw("SUM(price) as revenue")
            )
                ->where('created_at', '>=', Carbon::now()->subMonths($range))
                ->groupBy('year', 'week')
                ->orderBy('year')
                ->orderBy('week')
                ->get();
        } else { // monthly
            $growthData = UserSubscription::select(
                DB::raw("YEAR(created_at) as year"),
                DB::raw("MONTH(created_at) as month"),
                DB::raw("COUNT(*) as count"),
                DB::raw("SUM(price) as revenue")
            )
                ->where('created_at', '>=', Carbon::now()->subMonths($range))
                ->groupBy('year', 'month')
                ->orderBy('year')
                ->orderBy('month')
                ->get();
        }

        $growthDataGraph = $growthData->map(function ($item) use ($period) {
            if ($period === 'daily') {
                return \Carbon\Carbon::parse($item->date)->format('M d, Y');
            } elseif ($period === 'weekly') {
                return 'Week ' . $item->week . ', ' . $item->year;
            } else {
                return \Carbon\Carbon::createFromDate($item->year, $item->month)->format('M Y');
            }
        });
        // dd($growthData);
        return view('admin.analytics.subscription-growth', compact('growthData', 'growthDataGraph', 'period', 'range'));
    }
}
