<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use Illuminate\Http\Request;

class GymApiController extends Controller
{
    /**
     * Get all gyms
     */
    public function index()
    {
        $gyms = Gym::all();
        
        return response()->json([
            'success' => true,
            'data' => $gyms,
            'message' => 'Gyms retrieved successfully'
        ]);
    }

    /**
     * Get single gym
     */
    public function show($id)
    {
        $gym = Gym::find($id);
        
        if (!$gym) {
            return response()->json([
                'success' => false,
                'message' => 'Gym not found'
            ], 404);
        }
        
        return response()->json([
            'success' => true,
            'data' => $gym,
            'message' => 'Gym retrieved successfully'
        ]);
    }
}