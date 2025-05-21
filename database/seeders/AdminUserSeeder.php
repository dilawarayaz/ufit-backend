<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\ActivityLog;
use App\Models\PaymentHistory;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Faker\Factory as Faker;

class AdminUserSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();
        $defaultGymId = 1;

        // 🚨 Ensure Admin is inserted FIRST (will be ID = 1 if table was empty)
        $admin = $this->createUserWithLogs([
            'first_name'   => 'Admin',
            'last_name'    => 'Jao',
            'email'        => 'admin@gym.com',
            'phone_number' => '03001234567',
            'is_admin'     => true,
            'is_paid'      => true,
            'gym_id'       => $defaultGymId,
            'role_id'      => 1,
            'password'     => bcrypt('12345678'),
        ]);

        // Baqi random users banayein
        for ($i = 0; $i < 10; $i++) {
            $this->createUserWithLogs([
                'first_name'   => $faker->firstName,
                'last_name'    => $faker->lastName,
                'email'        => $faker->unique()->safeEmail,
                'phone_number' => '03' . $faker->numberBetween(100000000, 999999999),
                'is_admin'     => false,
                'is_paid'      => $faker->boolean(),
                'gym_id'       => $defaultGymId,
                'role_id'      => $faker->randomElement([2, 3]), // Only non-admin
                'password'     => Hash::make('password'),
            ]);
        }
    }

    protected function createUserWithLogs(array $attributes)
    {
        // Prevent duplicate creation
        $existingUser = User::where('email', $attributes['email'])->first();
        if ($existingUser) {
            return $existingUser;
        }

        $user = User::create(array_merge($attributes, [
            'email_verified_at' => now(),
            'remember_token'    => Str::random(10),
        ]));

        ActivityLog::create([
            'user_id'       => $user->id,
            'activity_type' => 'Seeder Creation',
            'description'   => 'User created via seeder',
        ]);

        if ($user->is_paid) {
            PaymentHistory::create([
                'user_id'        => $user->id,
                'amount'         => 2000,
                'paid_at'        => now(),
                'payment_method' => 'Seeder Method',
                'status'         => 'completed',
            ]);
        }

        return $user;
    }
}
