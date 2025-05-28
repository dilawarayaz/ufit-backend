<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserSubscription;
use Carbon\Carbon;
use Illuminate\Http\Request;

class UserSubscriptionController extends Controller
{
    public function index()
    {
        $subscriptions = UserSubscription::with('user')
            ->orderBy('end_date', 'desc')
            ->paginate(10);
        // dd($subscriptions);
        $currentPage = $subscriptions->currentPage();
        $totalPages = $subscriptions->lastPage();
        return view('admin.user-subscriptions.index', compact('subscriptions', 'currentPage', 'totalPages'));
    }

       /**
     * Show the form for creating a new subscription.
     */
    public function create()
    {
        $users = User::all(); // Get all users to select from
        return view('admin.user-subscriptions.create', compact('users'));
    }


  /**
     * Store a newly created subscription.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',
        ]);

        try {
            UserSubscription::create($validated);
            return redirect()
                ->route('admin.user-subscriptions.index')
                ->with('success', 'Subscription added successfully!');
        } catch (\Exception $e) {
            return redirect()
                ->route('admin.user-subscriptions.index')
                ->with('error', 'Error adding subscription: ' . $e->getMessage());
        }
    }


/**
     * Show the form for extending a subscription.
     */
    public function edit($id)
    {
        $subscription = UserSubscription::findOrFail($id);
        return view('admin.user-subscriptions.edit', compact('subscription'));
    }

     /**
     * Extend an existing subscription.
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'extension_days' => 'required|integer|min:1',
        ]);

        try {
            $subscription = UserSubscription::findOrFail($id);
            
            // Convert current end date to Carbon instance
            $endDate = Carbon::parse($subscription->end_date);
            
            // Add extension days
            $newEndDate = $endDate->addDays($validated['extension_days']);
            
            // Update subscription
            $subscription->update(['end_date' => $newEndDate]);
            
            return redirect()
                ->route('admin.user-subscriptions.index')
                ->with('success', 'Subscription extended successfully!');
        } catch (\Exception $e) {
            return redirect()
                ->route('admin.user-subscriptions.index')
                ->with('error', 'Error extending subscription: ' . $e->getMessage());
        }
    }


    /**
     * Remove the specified subscription from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $subscription = UserSubscription::findOrFail($id);
            $subscription->delete();

            return redirect()
                ->route('admin.user-subscriptions.index')
                ->with('success', 'Subscription deleted successfully!');
        } catch (\Exception $e) {
            return redirect()
                ->route('admin.user-subscriptions.index')
                ->with('error', 'Error deleting subscription: ' . $e->getMessage());
        }
    }
}
