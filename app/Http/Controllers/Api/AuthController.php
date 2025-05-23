<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\OtpMail;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;

class AuthController extends Controller
{
    // ✅ Step 1: Register + Send OTP
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
                Password::min(8)->letters()->mixedCase()->numbers()->symbols(),
            ],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validation error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Save data temporarily in cache
        $otp = rand(1000, 9999);
        $data = $request->only(['first_name', 'last_name', 'email', 'phone_number', 'password']);
        $data['password'] = Hash::make($data['password']);

        Cache::put('register_' . $data['email'], $data, now()->addMinutes(10));
        Cache::put('otp_' . $data['email'], $otp, now()->addMinutes(10));
          
         Mail::to($data['email'])->send(new OtpMail($otp));
        // TODO: Send email instead of returning OTP (for production)
        return response()->json([
            'message' => 'OTP sent to email',
            
        ]);
    }

    // ✅ Step 2: Verify OTP & Create User
    public function verifyOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required'
        ]);

        $cachedOtp = Cache::get('otp_' . $request->email);
        $userData = Cache::get('register_' . $request->email);

        if (!$cachedOtp || $cachedOtp != $request->otp) {
            return response()->json(['message' => 'Invalid or expired OTP'], 400);
        }

        // Create user
        $user = User::create($userData);
        $token = $user->createToken('auth_token')->plainTextToken;

        // Clear cache
        Cache::forget('register_' . $request->email);
        Cache::forget('otp_' . $request->email);

        return response()->json([
            'message' => 'User verified and registered successfully',
            'user' => $user,
            'access_token' => $token,
            'token_type' => 'Bearer'
        ]);
    }

    // ✅ Login
    public function login(Request $request)
    {
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

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $user->tokens()->delete(); // single device login
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Login successful',
            'user' => $user->only(['id', 'first_name', 'last_name', 'email']),
            'access_token' => $token,
            'token_type' => 'Bearer'
        ]);
    }

    // ✅ Logout
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    // ✅ Send OTP for Reset Password
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
        Cache::put('reset_otp_' . $user->email, $otp, now()->addMinutes(10));
          Mail::to($user->email)->send(new OtpMail($otp));
        return response()->json([
            'message' => 'OTP sent successfully',
            
        ]);
    }

    // ✅ Reset Password using OTP
    public function resetPasswordWithEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required|string',
            'new_password' => 'required|string|confirmed|min:6',
        ]);
  
        $user = User::where('email', $request->email)->first();
        $cachedOtp = Cache::get('reset_otp_' . $request->email);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        if (!$cachedOtp || $cachedOtp != $request->otp) {
            return response()->json(['message' => 'Invalid OTP'], 400);
        }

        $user->password = Hash::make($request->new_password);
        $user->save();

        Cache::forget('reset_otp_' . $request->email);

        return response()->json(['message' => 'Password reset successfully'], 200);
    }
}
