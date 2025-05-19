<?php

namespace Database\Seeders;

use App\Models\Payment;
use App\Models\User;
use Illuminate\Database\Seeder;

class PaymentsTableSeeder extends Seeder
{
    public function run()
    {
        $user = User::first(); // Sab se pehla user le rahe hain

        if (!$user) {
            // Agar koi user hi nahi hai to pehle ek user create kar len
            $user = User::create([
                'name' => 'Test User',
                'email' => 'testuser@example.com',
                'password' => bcrypt('password') // Dummy password
            ]);
        }

        // Sample payment data
        $payments = [
            [
                'user_id' => $user->id,
                'amount' => 100.00,
                'status' => 'success',
                'payment_method' => 'stripe',
                'transaction_id' => 'test_txn_'.uniqid(),
            ],
            [
                'user_id' => $user->id,
                'amount' => 0.01, // Edge case: minimum amount
                'status' => 'failed',
                'payment_method' => 'stripe',
                'transaction_id' => 'test_failed_'.uniqid(),
            ],
            [
                'user_id' => $user->id,
                'amount' => 250.50,
                'status' => 'pending',
                'payment_method' => 'paypal',
                'transaction_id' => 'test_pending_'.uniqid(),
            ],
            [
                'user_id' => $user->id,
                'amount' => 9999.99,
                'status' => 'success',
                'payment_method' => 'bank_transfer',
                'transaction_id' => 'test_bank_'.uniqid(),
            ],
        ];

        // Insert all payments
        foreach ($payments as $payment) {
            Payment::create($payment);
        }
    }
}
