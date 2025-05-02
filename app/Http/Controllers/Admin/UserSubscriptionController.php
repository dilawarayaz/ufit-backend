<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\UserSubscription;
use Illuminate\Http\Request;

class UserSubscriptionController extends Controller
{
    public function index()
    {
        $subscriptions = UserSubscription::with('user')
            ->orderBy('end_date', 'desc')
            ->paginate(10);
            
        return view('admin.user-subscriptions.index', compact('subscriptions'));
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