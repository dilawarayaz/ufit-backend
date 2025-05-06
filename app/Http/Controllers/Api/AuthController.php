<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'phone_number' => 'required|string|max:15|unique:users',
            'password' => [
                'required',
                'confirmed',
                Password::min(8)
                    ->letters()
                    ->mixedCase()
                    ->numbers()
                    ->symbols()
            ],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        $user = User::create([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'phone_number' => $request->phone_number,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'User registered successfully',
            'user' => $user,
            'access_token' => $token,
            'token_type' => 'Bearer'
        ], 201);
    }


    public function login(Request $request)
    {
        // Validate login request
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Find user by email
        $user = User::where('email', $request->email)->first();

        // Check if user exists and password is correct
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'Invalid credentials'
            ], 401);
        }

        // Delete all existing tokens (optional - for single device login)
        $user->tokens()->delete();

        // Create Sanctum token
        $token = $user->createToken('auth_token')->plainTextToken;

        // Return success response with token
        return response()->json([
            'message' => 'Login successful',
            'user' => $user->only(['id', 'first_name', 'last_name', 'email']),
            'access_token' => $token,
            'token_type' => 'Bearer'
        ], 200);
    }

    public function logout(Request $request)
    {
        // Revoke the token that was used to authenticate the current request
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Successfully logged out'
        ], 200);
    }
    public function sendEmailOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);
    
        $user = User::where('email', $request->email)->first();
    
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
    
        $otp = rand(1000, 9999);
    
        // Store OTP in cache for 5 minutes
        Cache::put('email_otp_' . $user->email, $otp, now()->addMinutes(5));
    
        // For development purpose (real app will send via email)
        // You can also implement a Mailable if needed
        return response()->json([
            'message' => 'OTP sent successfully to email',
            'otp' => $otp // remove in production
        ], 200);
    }

    public function resetPasswordWithEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required|string',
            'new_password' => 'required|string|confirmed|min:6',
        ]);
    
        $user = User::where('email', $request->email)->first();
    
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
    
        $cachedOtp = Cache::get('email_otp_' . $user->email);
    
        if ($cachedOtp != $request->otp) {
            return response()->json(['message' => 'Invalid OTP'], 400);
        }
    
        $user->password = Hash::make($request->new_password);
        $user->save();
    
        Cache::forget('email_otp_' . $user->email);
    
        return response()->json(['message' => 'Password reset successfully'], 200);
    }
    public function verifyOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required|string',
        ]);
    
        $user = User::where('email', $request->email)->first();
    
        if (!$user || $user->otp !== $request->otp) {
            return response()->json(['message' => 'Invalid OTP'], 400);
        }
    
        // Optionally clear OTP after successful verification
        $user->otp = null;
        $user->save();
    
        return response()->json(['message' => 'OTP verified successfully']);
    }
        
}
