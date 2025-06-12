<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Enrollment;
use App\Models\Gym;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GymOwnerController extends Controller
{
    public function getEnrollments(Request $request)
    {
        $user = Auth::user();
        
        if (!$user->is_gym_owner) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }
        
        // Get gyms owned by this user with eager loading
        $gyms = Gym::where('owner_id', $user->id)->pluck('id');
        
        // Get enrollments with related data
        $enrollments = Enrollment::with([
                'user', 
                'subscription.plan',
                'gym' => function($query) {
                    $query->select('id', 'name', 'location');
                }
            ])
            ->whereIn('gym_id', $gyms)
            ->where('status', 'active')
            ->orderBy('created_at', 'desc')
            ->paginate(10);
        
        return response()->json([
            'success' => true,
            'enrollments' => $enrollments,
            'total_gyms' => count($gyms)
        ]);
    }

    public function getGymEnrollments(Request $request, $gymId)
    {
        $user = Auth::user();
        
        if (!$user->is_gym_owner) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }
        
        // Verify the gym belongs to this owner
        $gym = Gym::where('id', $gymId)
            ->where('owner_id', $user->id)
            ->firstOrFail();
        
        $enrollments = Enrollment::with(['user', 'subscription.plan'])
            ->where('gym_id', $gymId)
            ->where('status', 'active')
            ->orderBy('created_at', 'desc')
            ->paginate(10);
        
        return response()->json([
            'success' => true,
            'enrollments' => $enrollments,
            'gym' => $gym->only(['id', 'name', 'location'])
        ]);
    }
    public function getNotifications(Request $request)
{
    $user = Auth::user();
    
    if (!$user->is_gym_owner) {
        return response()->json(['error' => 'Unauthorized'], 403);
    }
    
    $notifications = $user->notifications()
        ->orderBy('created_at', 'desc')
        ->paginate(10);
    
    return response()->json([
        'success' => true,
        'notifications' => $notifications
    ]);
}

public function markAsRead(Request $request, $id)
{
    $user = Auth::user();
    $notification = $user->notifications()->where('id', $id)->first();
    
    if ($notification) {
        $notification->markAsRead();
    }
    
    return response()->json(['success' => true]);
}
}