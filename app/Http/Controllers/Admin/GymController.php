<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use App\Models\GymImage;
use App\Models\Region;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class GymController extends Controller
{
    public function index()
    {
        $gyms = Gym::withCount(['visits', 'reviews'])
            ->withAvg('reviews', 'rating')
            ->paginate(10);

        return view('admin.gyms.index', compact('gyms'));
    }
    public function show($id)
    {
        $gym = Gym::with(['visits', 'reviews'])
            ->withCount(['visits', 'reviews'])
            ->withAvg('reviews', 'rating')
            ->findOrFail($id);

        return view('admin.gyms.show', compact('gym'));
    }

    public function pendingApplications()
    {
        // dd('pendingApplications');
        $pendingGyms = Gym::where('status', 'pending')->paginate(10);
        return view('admin.gyms.pending', compact('pendingGyms'));
    }

    public function create()
    {
        $regions = Region::all();
        return view('admin.gyms.create',compact('regions'));
    }

  public function store(Request $request)
{
    $validated = $request->validate([
        'first_name' => 'required|string|max:255',
        'last_name' => 'required|string|max:255',
        'name' => 'required|string|max:255',
        'address' => 'required|string',
        'phone_number' => 'required|string|unique:users',
        'email' => 'required|email|unique:users',
        'password' => 'required|string|min:8',
        'opening_time' => 'required',
        'closing_time' => 'required',
        'description' => 'nullable|string',
        'facilities' => 'nullable|array',
        'facilities.*' => 'string',
        'amenities' => 'nullable|array',
        'amenities.*' => 'string',
        'commission_rate' => 'required|numeric|min:0|max:100',
        'latitude' => 'nullable|numeric',
        'longitude' => 'nullable|numeric',
        'status' => 'required|in:pending,approved,rejected',
        'images' => 'nullable|array',
        'images.*' => 'image|mimes:jpeg,png,jpg,gif',
        'payment_settings' => 'nullable|array',
        'region_id' => 'required|integer|exists:regions,id',
    ]);

    // Create user
    $user = new User();
    $user->first_name = $request->first_name;
    $user->last_name = $request->last_name;
    $user->email = $request->email;
    $user->phone_number = $request->phone_number;
    $user->password = Hash::make($request->password);
    $user->role_id = 2;
    $user->save();

    // Create gym
    $gym = Gym::create([
        'name' => $validated['name'],
        'address' => $validated['address'],
        'phone' => $validated['phone_number'],
        'email' => $validated['email'],
        'opening_time' => $validated['opening_time'],
        'closing_time' => $validated['closing_time'],
        'description' => $validated['description'] ?? null,
        'facilities' => json_encode($validated['facilities'] ?? []),
        'amenities' => json_encode($validated['amenities'] ?? []),
        'commission_rate' => $validated['commission_rate'],
        'latitude' => $validated['latitude'] ?? null,
        'longitude' => $validated['longitude'] ?? null,
        'status' => 'approved',
        'image_path' => null, // single image removed since we're using multiple images
        'payment_settings' => json_encode($request->input('payment_settings', [])),
        'owner_id' => $user->id,
        'region_id' => $request->region_id,
    ]);

    // Handle multiple images
     if ($request->hasFile('images')) {
        foreach ($request->file('images') as $image) {
             $imageName = rand(9, 9999) . time() . '.' . $image->extension();
                $image->move(public_path('uploads/gyms'), $imageName);
               $path = $imageName;

            // Assuming GymImage model exists with gym_id and image_path fields
            GymImage::create([
                'gym_id' => $gym->id,
                'image_path' => $path,
            ]);
        }
    }

    return redirect()->route('admin.gyms.index')->with('success', 'Gym created successfully.');
}



    public function edit($id)
    {
        $gym = Gym::findOrFail($id);
        return view('admin.gyms.edit', compact('gym'));
    }

public function update(Request $request, $id)
{
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'address' => 'required|string',
        'phone' => 'required|string',
        'email' => 'required|email',
        'opening_time' => 'required',
        'closing_time' => 'required',
        'description' => 'nullable|string',
        'facilities' => 'nullable|array',
        'facilities.*' => 'string',
        'amenities' => 'nullable|array',
        'amenities.*' => 'string',
        'commission_rate' => 'required|numeric|min:0|max:100',
        'latitude' => 'nullable|numeric',
        'longitude' => 'nullable|numeric',
        'status' => 'required|in:pending,approved,rejected',
        'images' => 'nullable|array',
        'images.*' => 'image|mimes:jpeg,png,jpg,gif',
        'payment_settings' => 'nullable|array',
        'region_id' => 'required|integer|exists:regions,id',
    ]);

    $gym = Gym::findOrFail($id);

    // Update gym details
    $gym->update([
        'name' => $validated['name'],
        'address' => $validated['address'],
        'phone' => $validated['phone'],
        'email' => $validated['email'],
        'opening_time' => $validated['opening_time'],
        'closing_time' => $validated['closing_time'],
        'description' => $validated['description'] ?? null,
        'facilities' => json_encode($validated['facilities'] ?? []),
        'amenities' => json_encode($validated['amenities'] ?? []),
        'commission_rate' => $validated['commission_rate'],
        'latitude' => $validated['latitude'] ?? null,
        'longitude' => $validated['longitude'] ?? null,
        'status' => $validated['status'],
        'payment_settings' => json_encode($request->input('payment_settings', [])),
        'region_id' => $validated['region_id'],
    ]);

    // Handle images
    if ($request->hasFile('images')) {
        // Optionally delete old images (and optionally delete files from public folder)
        foreach ($gym->images as $oldImage) {
            $imagePath = public_path('uploads/gyms/' . $oldImage->image_path);
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
            $oldImage->delete();
        }

        foreach ($request->file('images') as $image) {
            $imageName = rand(9, 9999) . time() . '.' . $image->extension();
            $image->move(public_path('uploads/gyms'), $imageName);
            $path = $imageName;

            GymImage::create([
                'gym_id' => $gym->id,
                'image_path' => $path,
            ]);
        }
    }

    return redirect()->route('admin.gyms.index')->with('success', 'Gym updated successfully.');
}

    public function destroy($id)
    {
        $gym = Gym::findOrFail($id);

        if ($gym->image_path) {
            Storage::disk('public')->delete($gym->image_path);
        }

        $gym->delete();

        return redirect()->route('admin.gyms.index')->with('success', 'Gym deleted successfully');
    }

    public function approveApplication($id)
    {
        $gym = Gym::findOrFail($id);
        $gym->update(['status' => 'approved']);

        return redirect()->route('admin.gyms.pending')->with('success', 'Gym application approved');
    }

    public function rejectApplication($id)
    {
        $gym = Gym::findOrFail($id);
        $gym->update(['status' => 'rejected']);

        return redirect()->route('admin.gyms.pending')->with('success', 'Gym application rejected');
    }

    public function showStatistics($id)
    {
        $gym = Gym::with(['visits', 'reviews'])
            ->withCount(['visits', 'reviews'])
            ->withAvg('reviews', 'rating')
            ->findOrFail($id);

        return view('admin.gyms.statistics', compact('gym'));
    }
}
