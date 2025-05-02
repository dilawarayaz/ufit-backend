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
        ]);

        SubscriptionPlan::create($request->all());

        return redirect()->route('admin.plans.index')
            ->with('success', 'Plan created successfully.');
    }

    /**
     * Display the specified resource (Plan).
     */
    public function show(SubscriptionPlan $plan)
    {
        // Using the relationship to get features of the plan
        $features = $plan->features;  // This will fetch the features of the plan
    
        return view('admin.plans.show', compact('plan', 'features'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SubscriptionPlan $plan)
    {
        return view('admin.plans.edit', compact('plan'));
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
        ]);

        $plan->update($request->all());

        return redirect()->route('admin.plans.index')
            ->with('success', 'Plan updated successfully.');
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

    // Plan Feature Management

    /**
     * Show the form to create a feature for a plan.
     */
    public function createFeature(SubscriptionPlan $plan)
    {
        return view('admin.plans.features.create', compact('plan'));
    }

    /**
     * Store a newly created feature for a plan.
     */
    public function storeFeature(Request $request, SubscriptionPlan $plan)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'limit' => 'nullable|integer|min:1',
        ]);

        // Store feature with associated plan_id
        $plan->features()->create([
            'name' => $request->name,
            'description' => $request->description,
            'limit' => $request->limit,
        ]);

        return redirect()->route('admin.plans.show', $plan->id)
            ->with('success', 'Feature added successfully.');
    }

    /**
     * Show the form for editing a feature for a plan.
     */
    public function editFeature(SubscriptionPlan $plan, PlanFeature $feature)
    {
        return view('admin.plans.features.edit', compact('plan', 'feature'));
    }

    /**
     * Update a feature for a plan.
     */
    public function updateFeature(Request $request, SubscriptionPlan $plan, PlanFeature $feature)
    {
        $request->validate([
            'name' => 'required|string|max:255',   
            'description' => 'nullable|string',
            'limit' => 'nullable|integer|min:1',
            'enabled' => 'boolean',
        ]);

        // Update feature
        $feature->update($request->all());

        return redirect()->route('admin.plans.show', $plan->id)
            ->with('success', 'Feature updated successfully.');
    }

    /**
     * Remove a feature from a plan.
     */
    public function destroyFeature(SubscriptionPlan $plan, PlanFeature $feature)
    {
        // Delete feature
        $feature->delete();

        return redirect()->route('admin.plans.show', $plan->id)
            ->with('success', 'Feature removed successfully.');
    }
}
