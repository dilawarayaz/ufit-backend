<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use Dotenv\Exception\ValidationException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class GymApiController extends Controller
{


    
    public function index()
    {
        $gyms = Gym::all();

        return response()->json([
            'success' => true,
            'data' => $gyms,
            'message' => 'Gyms retrieved successfully'
        ]);
    }

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

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string',
            'phone' => 'required|string',
            'email' => 'required|email',
            'opening_time' => 'required|date_format:H:i',
            'closing_time' => 'required|date_format:H:i|after:opening_time',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('gym_images', 'public');
        }

        $gym = Gym::create(array_merge($validated, ['image_path' => $imagePath]));

        return response()->json([
            'success' => true,
            'data' => $gym,
            'message' => 'Gym created successfully'
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $gym = Gym::find($id);
    
        if (!$gym) {
            return response()->json([
                'success' => false,
                'message' => 'Gym not found'
            ], 404);
        }
            requestValidate($request, [
                'name' => 'required|string|max:255',
                'address' => 'required|string',
                'phone' => 'required|string',
                'email' => 'required|email',
                'opening_time' => 'required|date_format:H:i',
                'closing_time' => 'required|date_format:H:i|after:opening_time',
                'description' => 'nullable|string',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);
    
    
        if ($request->hasFile('image')) {
            if ($gym->image_path) {
                Storage::disk('public')->delete($gym->image_path);
            }
            $imagePath = $request->file('image')->store('gym_images', 'public');
            $validated['image_path'] = $imagePath;
        }
    
        $gym->update($validated);
    
        return response()->json([
            'success' => true,
            'data' => $gym,
            'message' => 'Gym updated successfully'
        ]);
    }

    public function destroy($id)
    {
        $gym = Gym::find($id);

        if (!$gym) {
            return response()->json([
                'success' => false,
                'message' => 'Gym not found'
            ], 404);
        }

        if ($gym->image_path) {
            Storage::disk('public')->delete($gym->image_path);
        }

        $gym->delete();

        return response()->json([
            'success' => true,
            'message' => 'Gym deleted successfully'
        ]);
    }
}
