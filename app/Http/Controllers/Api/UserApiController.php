<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class UserApiController extends Controller
{
    /**
     * Get basic user profile
     */
    public function getProfile()
    {
        $id = Auth::user()->id;
        $user = User::where("id", $id)->with('activeSubscriptions.plan')->first();


        return response()->json([
            'success' => true,
            'data' => $user
        ]);
    }


    /**
     * Update user profile
     */
    public function updateProfile(Request $request)
    {
        $user = User::findOrFail(Auth::user()->id);

        $validator = Validator::make($request->all(), [
            'first_name' => 'sometimes|string|max:255',
            'last_name' => 'sometimes|string|max:255',
            'email' => 'sometimes|email|unique:users,email,' . $user->id,
            'phone_number' => 'sometimes|string|unique:users,phone_number,' . $user->id,
            'profile_picture' => 'sometimes|image',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation errors',
                'errors' => $validator->errors()
            ], 422);
        }

        $data = $request->only(['first_name', 'last_name', 'email', 'phone_number']);

     

         if ($request->hasFile('profile_picture')) {
                $imageName = rand(9, 9999) . time() . '.' . $request->profile_picture->extension();
                $request->profile_picture->move(public_path('uploads/users'), $imageName);
               $data['profile_picture'] = $imageName;
            }

        $user->update($data);
        $user = User::where('id',Auth::user()->id)->first();

        return response()->json([
            'success' => true,
            'message' => 'Profile updated successfully',
            'data' => [
                'first_name' => $user->first_name,
                'last_name' => $user->last_name,
                'email' => $user->email,
                'phone_number' => $user->phone_number,
                'profile_picture' => $user->profile_picture
                    
            ]
        ]);
    }
}
