<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
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
        $user = Auth::user();
        
        return response()->json([
            'success' => true,
            'data' => [
                'first_name' => $user->first_name,
                'last_name' => $user->last_name,
                'email' => $user->email,
                'phone_number' => $user->phone_number,
                'profile_picture' => $user->profile_picture 
                    ? Storage::url($user->profile_picture) 
                    : null,
            ]
        ]);
    }

    /**
     * Update user profile
     */
    public function updateProfile(Request $request)
    {
        $user = Auth::user();
        
        $validator = Validator::make($request->all(), [
            'first_name' => 'sometimes|string|max:255',
            'last_name' => 'sometimes|string|max:255',
            'email' => 'sometimes|email|unique:users,email,'.$user->id,
            'phone_number' => 'sometimes|string|unique:users,phone_number,'.$user->id,
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
          
        // Handle profile picture upload
        if ($request->hasFile('profile_picture')) {
            // Delete old picture if exists
            if ($user->profile_picture) {
                Storage::delete($user->profile_picture);
            }
            
            $path = $request->file('profile_picture')->store('profile_pictures');
            $data['profile_picture'] = $path;
        }

        $user->update($data);

        return response()->json([
            'success' => true,
            'message' => 'Profile updated successfully',
            'data' => [
                'first_name' => $user->first_name,
                'last_name' => $user->last_name,
                'email' => $user->email,
                'phone_number' => $user->phone_number,
                'profile_picture' => $user->profile_picture 
                    ? Storage::url($user->profile_picture) 
                    : null,
            ]
        ]);
    }
}