<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\PaymentIntent;
use Stripe\Customer;
use App\Models\User;

class StripePaymentController extends Controller
{
    public function createPaymentIntent(Request $request)
    {
        $request->validate([
            'amount' => 'required|numeric',
            'currency' => 'sometimes|string',
            'plan_id' => 'required|numeric|exists:subscription_plans,id',
            'user_id' => 'required|numeric|exists:users,id'
        ]);

        Stripe::setApiKey(env('STRIPE_SECRET'));

        try {
            $user = User::find($request->user_id);
            
            if (!$user->stripe_customer_id) {
                $customer = Customer::create([
                    'email' => $user->email,
                    'name' => $user->name,
                ]);
                $user->stripe_customer_id = $customer->id;
                $user->save();
            }

            $paymentIntent = PaymentIntent::create([
                'amount' => $request->amount * 100,
                'currency' => $request->currency ?? 'usd',
                'customer' => $user->stripe_customer_id,
                'metadata' => [
                    'plan_id' => $request->plan_id,
                    'user_id' => $request->user_id
                ],
            ]);

            return response()->json([
                'clientSecret' => $paymentIntent->client_secret,
                'paymentIntentId' => $paymentIntent->id
            ]);
            
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}