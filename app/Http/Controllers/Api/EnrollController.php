<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Gym;
use App\Models\UserSubscription;
use App\Models\SubscriptionPlan;
use App\Models\Enrollment;
use Illuminate\Support\Facades\DB;

class EnrollController extends Controller
{
    public function enroll(Request $request)
    {
        $request->validate([
            'gym_id' => 'required|exists:gyms,id'
        ]);

        $user = Auth::user();
        $gymId = $request->input('gym_id');

        if (!$user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $gym = Gym::findOrFail($gymId);
        if ($gym->status !== 'approved') {
            return response()->json(['error' => 'This gym is not currently available for enrollment'], 400);
        }

        // Check existing enrollment in the same gym
        $existingEnrollment = Enrollment::where('user_id', $user->id)
            ->where('gym_id', $gymId)
            ->where('status', 'active')
            ->first();

        if ($existingEnrollment) {
            return response()->json([
                'error' => 'You are already enrolled in this gym'
            ], 400);
        }

        $activeSubscription = UserSubscription::where('user_id', $user->id)
            ->where('is_active', 1)
            ->where('end_date', '>', now())
            ->first();

        if (!$activeSubscription) {
            return response()->json([
                'error' => 'You need an active subscription to enroll in a gym'
            ], 403);
        }

        $subscriptionPlan = SubscriptionPlan::find($activeSubscription->plan_id);

        if (!$this->isGymAvailableForSubscription($gym, $subscriptionPlan)) {
            return response()->json([
                'error' => 'Your current subscription does not include access to this gym'
            ], 403);
        }

        // Create enrollment record
        $enrollment = Enrollment::create([
            'user_id' => $user->id,
            'gym_id' => $gymId,
            'subscription_id' => $activeSubscription->id,
            'start_date' => now(),
            'end_date' => $activeSubscription->end_date,
            'status' => 'active'
        ]);

        // Update user's current gym
        $user->current_gym_id = $gymId;
        $user->save();

        // Notify gym owner
        $this->notifyGymOwner($gym, $user);

        return response()->json([
            'message' => 'Successfully enrolled in the gym!',
            'enrollment' => $enrollment,
            'gym' => $gym
        ]);
    }
   public function getEnrollments(Request $request)
{
    $user = Auth::user();
    
    if (!$user || !$user->isGymOwner()) {
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    $gymId = $user->ownedGym->id;
    
    $enrollments = Enrollment::with(['user', 'subscription.plan'])
        ->where('gym_id', $gymId)
        ->orderBy('created_at', 'desc')
        ->get();

    return response()->json(['enrollments' => $enrollments]);
}
   protected function notifyGymOwner($gym, $user)
{
    try {
        if ($gym->owner) {
            $gym->owner->notify(new \App\Notifications\NewEnrollmentNotification($user, $gym));
        }
    } catch (\Exception $e) {
        \Log::error('Notification failed: '.$e->getMessage());
    }
}

    protected function isGymAvailableForSubscription($gym, $subscriptionPlan)
    {
        // Premium subscription can access all gyms
        if ($subscriptionPlan->type === 'premium') {
            return true;
        }

        // Basic subscription can only access gyms that accept basic plan
        if ($subscriptionPlan->type === 'basic') {
            return DB::table('gym_plan')
                ->where('gym_id', $gym->id)
                ->where('subscription_plan_id', $subscriptionPlan->id)
                ->exists();
        }

        // Default deny
        return false;
    }
}