<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FavoriteGymController extends Controller
{
    // Add a gym to user's favorites
    public function favorite(Request $request, $gymId)
    {
        $user = Auth::user();
        $gym = Gym::find($gymId);

        if (!$gym) {
            return response()->json(['success' => false, 'message' => 'Gym not found'], 404);
        }

        $user->favoriteGyms()->syncWithoutDetaching([$gymId]);

        return response()->json(['success' => true, 'message' => 'Gym added to favorites']);
    }

    // Remove a gym from user's favorites
    public function unfavorite(Request $request, $gymId)
    {
        $user = Auth::user();

        $user->favoriteGyms()->detach($gymId);

        return response()->json(['success' => true, 'message' => 'Gym removed from favorites']);
    }

    // Get all favorite gyms of the authenticated user
    public function myFavorites()
    {
        $user = Auth::user();

        return response()->json([
            'success' => true,
            'data' => $user->favoriteGyms,
        ]);
    }
}
