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
        $gyms = Gym::paginate(10);
        return view('admin.gyms.index', compact('gyms'));
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
            'closing_time' => 'required|date_format:H:i|after:opening_time',
            'description' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // 2MB max
        ]);

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('gym_images', 'public');
        }

        Gym::create(array_merge($validated, ['image_path' => $imagePath]));

        return redirect()->route('admin.gyms.index')->with('success', 'Gym created successfully');
    }


    public function edit($id)
    {
        // Find the gym by ID
        $gym = Gym::findOrFail($id);

        // Return the edit view with the gym data
        return view('admin.gyms.edit', compact('gym'));
    }

    public function update(Request $request, $id)
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

        $gym = Gym::findOrFail($id);

        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($gym->image_path) {
                Storage::disk('public')->delete($gym->image_path);
            }
            $imagePath = $request->file('image')->store('gym_images', 'public');
            $validated['image_path'] = $imagePath;
        }

        $gym->update($validated);

        return redirect()->route('admin.gyms.index')->with('success', 'Gym updated successfully');
    }

    public function destroy($id)
    {
        $gym = Gym::findOrFail($id);
        
        // Delete associated image
        if ($gym->image_path) {
            Storage::disk('public')->delete($gym->image_path);
        }
        
        $gym->delete();

        return redirect()->route('admin.gyms.index')->with('success', 'Gym deleted successfully');
    }
}
