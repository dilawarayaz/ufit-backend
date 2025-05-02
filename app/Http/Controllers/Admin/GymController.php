<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use Illuminate\Http\Request;

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
        // Validate the incoming request
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string',
            'phone' => 'required|string',
            'email' => 'required|email',
            'opening_time' => 'required|date_format:H:i',
            'closing_time' => 'required|date_format:H:i|after:opening_time',
            'description' => 'nullable|string',
        ]);

        // Create a new gym entry
        Gym::create($validated);

        // Redirect back to the gyms index page with a success message
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
        // Validate the incoming request
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'address' => 'required|string',
            'phone' => 'required|string',
            'email' => 'required|email',
            'opening_time' => 'required',
            'closing_time' => 'required|after:opening_time',
            'description' => 'nullable|string',
        ]);

        // Find the gym by ID
        $gym = Gym::findOrFail($id);

        // Update the gym with the validated data
        $gym->update($validated);

        // Redirect to the gym's show page after update
        return redirect()->route('admin.gyms.index')->with('success', 'Gym updated successfully');
    }

    public function destroy($id)
    {
        $gym = Gym::findOrFail($id);
        $gym->delete();

        return redirect()->route('admin.gyms.index')->with('success', 'Gym deleted successfully');
    }
}
