<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SubscriptionPlan;
use App\Models\PlanFeature;
use Illuminate\Http\Request;

class PlanApiController extends Controller
{
    /**
     * Get all active plans
     */
    public function index()
    {
        $plans = SubscriptionPlan::where('status', 'active')
            ->with(['features' => function($query) {
                $query->where('enabled', true);
            }])
            ->get();

        return response()->json([
            'success' => true,
            'data' => $plans
        ]);
    }

    /**
     * Get a specific plan
     */
    public function show(SubscriptionPlan $plan)
    {
        return response()->json([
            'success' => true,
            'data' => $plan->load(['features' => function($query) {
                $query->where('enabled', true);
            }])
        ]);
    }

    /**
     * Get features of a specific plan
     */
    public function features(SubscriptionPlan $plan)
    {
        $features = $plan->features()->where('enabled', true)->get();
        
        return response()->json([
            'success' => true,
            'data' => $features
        ]);
    }
}