<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use Illuminate\Http\Request;
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
        return view('admin.gyms.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string',
            'phone' => 'required|string',
            'email' => 'required|email',
            'opening_time' => 'required|date_format:H:i',
            'closing_time' => [
                'required',
                'date_format:H:i',
                function ($attribute, $value, $fail) use ($request) {
                    if (strtotime($value) <= strtotime($request->opening_time)) {
                        $fail('Closing time must be after opening time.');
                    }
                }
            ],
            'description' => 'nullable|string',
            'facilities' => 'required|array',
            'facilities.*' => 'string',
            'commission_rate' => 'required|numeric|min:0|max:100',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'status' => 'required|in:pending,approved,rejected',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'payment_settings' => 'nullable|array',
        ]);

        // Handle image upload
        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('gym_images', 'public');
        }

        // Create Gym
        Gym::create([
            'name' => $validated['name'],
            'address' => $validated['address'],
            'phone' => $validated['phone'],
            'email' => $validated['email'],
            'opening_time' => $validated['opening_time'],
            'closing_time' => $validated['closing_time'],
            'description' => $validated['description'] ?? null,
            'facilities' => json_encode($validated['facilities'] ?? []),
            'commission_rate' => $validated['commission_rate'],
            'latitude' => $validated['latitude'] ?? null,
            'longitude' => $validated['longitude'] ?? null,
            'status' => 'approved',
            'image_path' => $imagePath,
            'payment_settings' => json_encode($request->input('payment_settings', [])),
        ]);

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
            'commission_rate' => 'required|numeric|min:0|max:100',
            'latitude' => 'nullable|numeric',
            'longitude' => 'nullable|numeric',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $gym = Gym::findOrFail($id);

        if ($request->hasFile('image')) {
            if ($gym->image_path) {
                Storage::disk('public')->delete($gym->image_path);
            }
            $imagePath = $request->file('image')->store('gym_images', 'public');
            $validated['image_path'] = $imagePath;
        }

        $gym->update(array_merge($validated, [
            'payment_settings' => json_encode($request->payment_settings ?? [])
        ]));

        return redirect()->route('admin.gyms.index')->with('success', 'Gym updated successfully');
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
