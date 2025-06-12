<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SubscriptionPlan;
use App\Models\PlanFeature;
use Illuminate\Http\Request;

class PlanApiController extends Controller
{
    /**
     * Get all active plans with basic info
     */
    public function index()
    {
        $plans = SubscriptionPlan::withCount(['gyms', 'features'])
            ->with([
                'features' => function ($query) {
                    $query->where('enabled', true)
                        ->select('id', 'subscription_plan_id', 'name', 'description', 'limit');
                },
                'gyms' => function ($query) {
                    $query->select('gyms.id', 'name', 'address', 'image_path', 'status')
                        ->where('status', 'approved');
                }
            ])
            ->where('status', 'active')
            ->orderBy('monthly_price')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $plans->map->toArray(),
            'message' => 'Active plans retrieved successfully'
        ]);
    }

    /**
     * Get detailed plan with features and approved gyms
     */
  public function show(SubscriptionPlan $plan)
{
    $plan->load([
        'features' => function ($query) {
            $query->where('enabled', true)
                ->select('id', 'subscription_plan_id', 'name', 'description', 'limit', 'is_unlimited')
                ->orderBy('name');
        },
        'gyms' => function ($query) {
            $query->select(
                'gyms.id', 
                'name', 
                'address', 
                'image_path',
                'status'
            )
            ->where('status', 'approved');
        }
    ]);

    // Add counts to the plan object
    $plan->gyms_count = $plan->gyms->count();
    $plan->features_count = $plan->features->count();

    $annualSavings = round((($plan->monthly_price * 12 - $plan->annual_price) / ($plan->monthly_price * 12)) * 100);

    return response()->json([
        'success' => true,
        'data' => [
            'plan' => $plan,
            'annual_savings' => $annualSavings
        ],
        'message' => 'Plan details retrieved successfully'
    ]);
}

    /**
     * Get only features of a specific plan
     */
    public function features(SubscriptionPlan $plan)
    {
        $features = $plan->features()
            ->orderBy('name')
            ->get(['id', 'name', 'description', 'limit', 'created_at']);

        return response()->json([
            'success' => true,
            'data' => $features,
            'message' => 'Plan features retrieved successfully'
        ]);
    }
}
