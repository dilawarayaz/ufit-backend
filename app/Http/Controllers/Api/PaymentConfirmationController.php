<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\PaymentIntent;
use App\Models\SubscriptionPlan;
use App\Models\UserSubscription;

class PaymentConfirmationController extends Controller
{
    public function confirmPayment(Request $request)
    {
        $request->validate([
            'paymentIntentId' => 'required|string',
            'plan_id' => 'required|numeric|exists:subscription_plan,id',
            'user_id' => 'required|numeric|exists:users,id'
        ]);

        Stripe::setApiKey(env('STRIPE_SECRET'));

        try {
            $paymentIntent = PaymentIntent::retrieve($request->paymentIntentId);

            if ($paymentIntent->status === 'succeeded') {
                $plan = SubscriptionPlan::find($request->plan_id);
                
                $endDate = now();
                if ($plan->duration_unit === 'month') {
                    $endDate = $endDate->addMonths($plan->duration);
                } elseif ($plan->duration_unit === 'year') {
                    $endDate = $endDate->addYears($plan->duration);
                } else {
                    $endDate = $endDate->addDays($plan->duration);
                }

                $subscription = UserSubscription::create([
                    'user_id' => $request->user_id,
                    'plan_id' => $request->plan_id,
                    'subscription_type' => 'stripe',
                    'is_active' => true,
                    'start_date' => now(),
                    'end_date' => $endDate,
                    'price' => $paymentIntent->amount / 100,
                    'payment_status' => 'paid',
                    'stripe_subscription_id' => $paymentIntent->id,
                    'stripe_customer_id' => $paymentIntent->customer,
                    'last_payment_date' => now(),
                ]);

                return response()->json([
                    'success' => true,
                    'subscription' => $subscription
                ]);
            }

            return response()->json(['error' => 'Payment not completed'], 400);
            
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}