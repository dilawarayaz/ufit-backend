<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gym;
use App\Models\GymReview;
use Illuminate\Http\Request;

class GymReviewController extends Controller
{
    public function index(Gym $gym)
    {
        $reviews = $gym->reviews()->with('user')->latest()->paginate(10);
        return view('admin.gyms.reviews.index', compact('gym', 'reviews'));
    }

    public function approve(Gym $gym, GymReview $review)
    {
        $review->update(['approved' => true]);
        return back()->with('success', 'Review approved successfully');
    }

    public function destroy(Gym $gym, GymReview $review)
    {
        $review->delete();
        return back()->with('success', 'Review deleted successfully');
    }
}