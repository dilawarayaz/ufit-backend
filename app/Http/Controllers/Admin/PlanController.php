<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
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
        $gyms = Gym::all();
        return view('admin.plans.create', compact('gyms'));
    }


    /**
     * Store a newly created resource in storage.
     */

public function store(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'type' => 'required|in:basic,premium,standard,startup',
        'monthly_price' => 'required|numeric|min:0',
        'annual_price' => 'nullable|numeric|min:0',
        'status' => 'required|in:active,inactive',
        'gyms' => 'nullable|array',
        'gyms.*' => 'exists:gyms,id',
        'features' => 'nullable|array',
        'features.*.name' => 'required_with:features|string|max:255',
        'features.*.description' => 'nullable|string',
        'features.*.limit' => 'nullable|integer|min:1',
    ]);

    // Create plan
    $plan = SubscriptionPlan::create([
        'name' => $request->name,
        'type' => $request->type,
        'monthly_price' => $request->monthly_price,
        'annual_price' => $request->annual_price,
        'status' => $request->status
    ]);

    // Add features
    if ($request->has('features')) {
        foreach ($request->features as $featureData) {
            $plan->features()->create([
                'name' => $featureData['name'],
                'description' => $featureData['description'] ?? null,
                'limit' => $featureData['limit'] ?? null,
            ]);
        }
    }

    // Attach gyms
    if ($request->has('gyms')) {
        $plan->gyms()->attach($request->gyms);
    }

    return redirect()->route('admin.plans.index')
        ->with('success', 'Plan created successfully with features and gyms.');
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
    $gyms = Gym::all();
    $selectedGyms = $plan->gyms->pluck('id')->toArray();

    return view('admin.plans.edit', compact('plan', 'features', 'gyms', 'selectedGyms'));
}

public function update(Request $request, SubscriptionPlan $plan)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'monthly_price' => 'required|numeric|min:0',
        'annual_price' => 'required|numeric|min:0',
        'status' => 'required|in:active,inactive',
        'gyms' => 'nullable|array',
        'gyms.*' => 'exists:gyms,id',
        'features' => 'nullable|array',
        'features.*.name' => 'required_with:features|string|max:255',
        'features.*.description' => 'nullable|string',
        'features.*.limit' => 'nullable|integer|min:1',
        'features.*.id' => 'nullable|exists:plan_features,id',
    ]);

    // Update plan fields
    $plan->update([
        'name' => $request->name,
        'monthly_price' => $request->monthly_price,
        'annual_price' => $request->annual_price,
        'status' => $request->status
    ]);

    // Sync gyms
    $plan->gyms()->sync($request->input('gyms', []));

    // Handle features
    if ($request->has('features')) {
        $existingFeatureIds = [];

        foreach ($request->features as $featureData) {
            if (isset($featureData['id'])) {
                $feature = $plan->features()->find($featureData['id']);
                if ($feature) {
                    $feature->update([
                        'name' => $featureData['name'],
                        'description' => $featureData['description'] ?? null,
                        'limit' => $featureData['limit'] ?? null,
                    ]);
                    $existingFeatureIds[] = $feature->id;
                }
            } else {
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
        $plan->features()->delete();
    }

    return redirect()->route('admin.plans.index')
        ->with('success', 'Plan updated successfully with features and gyms.');
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
