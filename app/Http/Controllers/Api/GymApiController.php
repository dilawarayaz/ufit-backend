<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class GymApiController extends Controller
{
  public function index()
{
    $gyms = Gym::with(['reviews.user', 'visits'])  // Nested eager load
        ->withCount(['visits', 'reviews'])         // Direct count only
        ->withAvg('reviews', 'rating')
        ->where('status', 'approved')
        ->get();

    return response()->json([
        'success' => true,
        'data' => $gyms,
        'message' => 'Gyms retrieved successfully'
    ]);
}


   public function show($id)
{
    $gym = Gym::with(['reviews.user', 'visits'])
        ->withCount(['visits', 'reviews']) // ✅ only direct relationships
        ->withAvg('reviews', 'rating')
        ->find($id);

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
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'address' => 'required|string',
            'opening_time' => 'required',
            'closing_time' =>'required',
            'description' => 'nullable|string',
            'facilities' => 'nullable|array',
            'facilities.*' => 'string',
            'commission_rate' => 'nullable|numeric|min:0|max:100',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'image' => 'nullable|image',
            'region_id' => 'required|integer|exists:regions,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
                'message' => 'Validation failed'
            ], 422);
        }

        $validated = $validator->validated();

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('gym_images', 'public');
        }

        $gym = Gym::create([
            'name' => $validated['name'],
            'address' => $validated['address'],
            'opening_time' => $validated['opening_time'],
            'closing_time' => $validated['closing_time'],
            'description' => $validated['description'] ?? null,
            'facilities' => json_encode($validated['facilities'] ?? []),
            'commission_rate' => $validated['commission_rate'] ?? 0,
            'latitude' => $validated['latitude'] ?? null,
            'longitude' => $validated['longitude'] ?? null,
            'status' => 'pending', // New gyms should be pending approval
            'region_id'=> $request->region_id,
            'image_path' => $imagePath,
            'owner_id' => auth()->id(),
       
        ]);
  
        return response()->json([
            'success' => true,
            'data' => $gym,
            'message' => 'Gym created successfully. Waiting for admin approval.'
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

        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:255',
            'address' => 'sometimes|required|string',
            'phone' => 'sometimes|required|string',
            'email' => 'sometimes|required|email',
            'opening_time' => 'required',
            'closing_time' =>'required',
            'description' => 'nullable|string',
            'facilities' => 'nullable|array',
            'facilities.*' => 'string',
            'commission_rate' => 'nullable|numeric|min:0|max:100',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'image' => 'nullable|image',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
                'message' => 'Validation failed'
            ], 422);
        }

        $validated = $validator->validated();

        if ($request->hasFile('image')) {
            if ($gym->image_path) {
                Storage::disk('public')->delete($gym->image_path);
            }
            $imagePath = $request->file('image')->store('gym_images', 'public');
            $validated['image_path'] = $imagePath;
        }

        if (isset($validated['facilities'])) {
            $validated['facilities'] = json_encode($validated['facilities']);
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

    // Additional API endpoints for mobile app
    public function pendingGyms()
    {
        $pendingGyms = Gym::where('status', 'pending')->get();
        
        return response()->json([
            'success' => true,
            'data' => $pendingGyms,
            'message' => 'Pending gyms retrieved successfully'
        ]);
    }

    public function approveGym($id)
    {
        $gym = Gym::find($id);
        
        if (!$gym) {
            return response()->json([
                'success' => false,
                'message' => 'Gym not found'
            ], 404);
        }

        $gym->update(['status' => 'approved']);

        return response()->json([
            'success' => true,
            'message' => 'Gym approved successfully'
        ]);
    }

    public function rejectGym($id)
    {
        $gym = Gym::find($id);
        
        if (!$gym) {
            return response()->json([
                'success' => false,
                'message' => 'Gym not found'
            ], 404);
        }

        $gym->update(['status' => 'rejected']);

        return response()->json([
            'success' => true,
            'message' => 'Gym rejected successfully'
        ]);
    }


    public function nearby(Request $request)
{
     dd('Reached nearby method', $request->all());
    $validator = Validator::make($request->all(), [
        'latitude' => 'required|numeric',
        'longitude' => 'required|numeric',
        'radius' => 'nullable|numeric', // optional, default 10 km
    ]);

    if ($validator->fails()) {
        return response()->json([
            'success' => false,
            'errors' => $validator->errors(),
        ], 422);
    }

    $latitude = $request->latitude;
    $longitude = $request->longitude;
    $radius = $request->radius ?? 10;

    $gyms = Gym::selectRaw("*, 
        (6371 * acos(cos(radians(?)) * cos(radians(latitude)) * 
        cos(radians(longitude) - radians(?)) + 
        sin(radians(?)) * sin(radians(latitude)))) AS distance", 
        [$latitude, $longitude, $latitude])
        ->where('status', 'approved')
        ->having("distance", "<=", $radius)
        ->orderBy("distance")
        ->get();
    //  dd($gyms);
    return response()->json([
        'success' => true,
        'data' => $gyms,
        'message' => 'Nearby gyms fetched successfully',
    ]);
}

public function popular()
{
    $gyms = Gym::withCount(['visits', 'reviews'])
        ->withAvg('reviews', 'rating')
        ->where('status', 'approved')
        ->orderByDesc('reviews_count')
        ->take(10)
        ->get()
        ->toArray(); // Convert to array to see all data
    
    if (empty($gyms)) {
        // Debug why no gyms are returned
        $totalApproved = Gym::where('status', 'approved')->count();
        $totalGyms = Gym::count();
        
        return response()->json([
            'success' => false,
            'debug' => [
                'total_gyms' => $totalGyms,
                'approved_gyms' => $totalApproved,
                'gyms_with_visits' => Gym::has('visits')->count(),
                'gyms_with_reviews' => Gym::has('reviews')->count(),
            ],
            'message' => 'Debug information',
        ]);
    }
    
    return response()->json([
        'success' => true,
        'data' => $gyms,
        'message' => 'Popular gyms retrieved successfully',
    ]);
}

}
