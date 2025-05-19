<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Models\Payment;
use App\Models\PaymentHistory;
use App\Models\User;
use App\Models\Role;
use App\Models\SubscriptionPlan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{


    public function create()
    {
        $roles = Role::all();
        // dd($roles);
        $subscriptionPlans = SubscriptionPlan::all();
        return view('admin.users.create', compact('roles', 'subscriptionPlans'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|email|unique:users',
            'phone_number' => 'required|unique:users',
            'password' => 'required|string|min:8',
            'role_id' => 'required|exists:roles,id',
        ]);

        // Create the user
        $user = User::create([
            'first_name' => $validated['first_name'],
            'last_name' => $validated['last_name'],
            'email' => $validated['email'],
            'phone_number' => $validated['phone_number'],
            'password' => Hash::make($validated['password']),
            'role_id' => $validated['role_id'],
            'is_admin' => false, // Ensure this is not an admin
        ]);

        return redirect()->route('admin.users.index')->with('success', 'User created successfully');
    }
    public function index(Request $request)
    {
        $query = User::query()->with(['subscriptions.plan', 'role']);

        // 🔍 Search
        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('first_name', 'like', "%$search%")
                    ->orWhere('last_name', 'like', "%$search%")
                    ->orWhereRaw("CONCAT(first_name, ' ', last_name) LIKE ?", ["%$search%"])
                    ->orWhere('email', 'like', "%$search%");
            });
        }

        // 📦 Filter by subscription plan
        if ($request->has('subscription_plan')) {
            $query->whereHas('subscriptions', function ($q) use ($request) {
                $q->where('subscription_plan_id', $request->subscription_plan);
            });
        }

        // 🚫 Filter by suspension status
        if ($request->has('status')) {
            $query->where('is_suspended', $request->status === 'suspended');
        }

        // 🧑‍💼 Filter by role
        if ($request->has('role')) {
            $query->where('role_id', $request->role);
        }

        // 🗓️ Filter by date range
        if ($request->has('date_from') && $request->has('date_to')) {
            $query->whereBetween('created_at', [
                $request->date_from,
                $request->date_to
            ]);
        }

        // 🔃 Sorting
        $sort = $request->get('sort', 'created_at');
        $direction = $request->get('direction', 'desc');

        if ($sort === 'name') {
            $query->orderByRaw("CONCAT(first_name, ' ', last_name) $direction");
        } else {
            $query->orderBy($sort, $direction);
        }

        // ✅ Custom Pagination Logic
        $perPage = 10; // Har page pe 10 records
        $currentPage = $request->input('page', 1); // Default page 1

        // Pehle total records count karo (search & filter ke baad)
        $total = $query->count();

        // Skip & Take use karo data laane ke liye
        $users = $query->skip(($currentPage - 1) * $perPage)
            ->take($perPage)
            ->get();

        $totalPages = ceil($total / $perPage); // Total pages calculate karo

        // Ye data frontend ke liye bhejna
        $subscriptionPlans = SubscriptionPlan::all();
        $roles = Role::all();
        // dd($users);
        return view('admin.users.index', compact(
            'users',
            'subscriptionPlans',
            'roles',
            'totalPages',
            'currentPage'
        ));
    }


    public function edit(User $user)
    {
        $roles = Role::all();
        $subscriptionPlans = SubscriptionPlan::all();
        return view('admin.users.edit', compact('user', 'roles', 'subscriptionPlans'));
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'roles' => 'sometimes|array',
        ]);

        $user->update($validated);

        if ($request->has('roles')) {
            $user->roles()->sync($request->roles);
        }

        return redirect()->route('admin.users.index')->with('success', 'User updated successfully');
    }
    public function show(User $user)
    {
        $subscriptionPlans = SubscriptionPlan::all();
        $activityLogs = ActivityLog::where('user_id', $user->id)->latest()->paginate(10);
        $payments = PaymentHistory::where('user_id', $user->id)->latest()->paginate(10);

        return view('admin.users.show', compact('user', 'subscriptionPlans', 'activityLogs', 'payments'));
    }

    // Reactivate user account
    public function reactivate(User $user)
    {
           dd($user);
        $user->update(['is_suspended' => false]);
        return back()->with('success', 'User reactivated successfully');
    }
    public function suspend(User $user)
    {
        // Check if the user is already suspended, if not, suspend them
        if (!$user->is_suspended) {
            $user->is_suspended = true;  // Mark as suspended
            $user->save();

            return redirect()->back()->with('success', 'User suspended successfully.');
        }

        return redirect()->back()->with('error', 'User is already suspended.');
    }
    // Manual subscription change
    public function changeSubscription(User $user, Request $request)
    {
        $validated = $request->validate([
            'subscription_plan_id' => 'required|exists:subscription_plans,id',
        ]);

        $user->subscriptions()->create([
            'subscription_plan_id' => $validated['subscription_plan_id'],
            'start_date' => now(),
            'end_date' => now()->addMonths(1), // Example: set for 1 month
            'is_active' => true,
        ]);

        return back()->with('success', 'Subscription changed successfully');
    }
}
