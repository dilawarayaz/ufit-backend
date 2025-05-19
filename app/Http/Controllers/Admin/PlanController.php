<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PlanFeature;
use App\Models\SubscriptionPlan;
use Illuminate\Http\Request;

class PlanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $plans = SubscriptionPlan::latest()->paginate(10);
        return view('admin.plans.index', compact('plans'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.plans.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'status' => 'required|in:active,inactive',
            'features' => 'nullable|array',
            'features.*.name' => 'required_with:features|string|max:255',
            'features.*.description' => 'nullable|string',
            'features.*.limit' => 'nullable|integer|min:1',
        ]);

        // Create the plan
        $plan = SubscriptionPlan::create($request->only(['name', 'price', 'status']));

        // Add features if any
        if ($request->has('features')) {
            foreach ($request->features as $featureData) {
                $plan->features()->create([
                    'name' => $featureData['name'],
                    'description' => $featureData['description'] ?? null,
                    'limit' => $featureData['limit'] ?? null,
                ]);
            }
        }

        return redirect()->route('admin.plans.index')
            ->with('success', 'Plan created successfully with features.');
    }

    /**
     * Display the specified resource (Plan).
     */
    public function show(SubscriptionPlan $plan)
    {
        $features = $plan->features;
        return view('admin.plans.show', compact('plan', 'features'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SubscriptionPlan $plan)
    {
        $features = $plan->features;
        return view('admin.plans.edit', compact('plan', 'features'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SubscriptionPlan $plan)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'status' => 'required|in:active,inactive',
            'features' => 'nullable|array',
            'features.*.name' => 'required_with:features|string|max:255',
            'features.*.description' => 'nullable|string',
            'features.*.limit' => 'nullable|integer|min:1',
            'features.*.id' => 'nullable|exists:plan_features,id', // For existing features
            'features.*.enabled' => 'boolean',
        ]);

        // Update the plan
        $plan->update($request->only(['name', 'price', 'status']));

        // Handle features
        if ($request->has('features')) {
            $existingFeatureIds = [];
            
            foreach ($request->features as $featureData) {
                if (isset($featureData['id'])) {
                    // Update existing feature
                    $feature = $plan->features()->find($featureData['id']);
                    if ($feature) {
                        $feature->update([
                            'name' => $featureData['name'],
                            'description' => $featureData['description'] ?? null,
                            'limit' => $featureData['limit'] ?? null,
                            'enabled' => $featureData['enabled'] ?? true,
                        ]);
                        $existingFeatureIds[] = $feature->id;
                    }
                } else {
                    // Create new feature
                    $newFeature = $plan->features()->create([
                        'name' => $featureData['name'],
                        'description' => $featureData['description'] ?? null,
                        'limit' => $featureData['limit'] ?? null,
                    ]);
                    $existingFeatureIds[] = $newFeature->id;
                }
            }
            
            // Delete features not included in the request
            $plan->features()->whereNotIn('id', $existingFeatureIds)->delete();
        } else {
            // If no features in request, delete all
            $plan->features()->delete();
        }

        return redirect()->route('admin.plans.index')
            ->with('success', 'Plan updated successfully with features.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SubscriptionPlan $plan)
    {
        $plan->delete();
        return redirect()->route('admin.plans.index')
            ->with('success', 'Plan deleted successfully.');
    }
}