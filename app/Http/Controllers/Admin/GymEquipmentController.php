<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use App\Models\GymEquipment;
use Illuminate\Http\Request;

class GymEquipmentController extends Controller
{
    public function index(Gym $gym)
    {
        $equipment = $gym->equipment()->paginate(10);
        return view('admin.gyms.equipment.index', compact('gym', 'equipment'));
    }

    public function create(Gym $gym)
    {
        return view('admin.gyms.equipment.create', compact('gym'));
    }

    public function store(Request $request, Gym $gym)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'category' => 'required|string',
            'quantity' => 'required|integer|min:1',
            'condition' => 'required|in:good,fair,poor,needs_repair',
            'last_maintenance_date' => 'nullable|date',
            'description' => 'nullable|string',
        ]);

        $gym->equipment()->create($validated);

        return redirect()->route('admin.gyms.equipment.index', $gym->id)
                       ->with('success', 'Equipment added successfully');
    }

    // Add edit, update, destroy methods
}