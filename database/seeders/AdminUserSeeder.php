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

        $this->createUserWithLogs([
            'first_name'   => 'Admin',
            'last_name'    => 'Jao',
            'email'        => 'admin@gym.com',
            'phone_number' => '03001234567',
            'is_admin'     => 1,
            'is_paid'      => true,
            'gym_id'       => $defaultGymId,
            'password'     => bcrypt('12345678'),
        ]);

        $this->createUserWithLogs([
            'first_name' => 'Ali',
            'last_name' => 'Khan',
            'email' => 'ali@example.com',
            'phone_number' => '03001112222',
            'is_admin' => 0,
            'is_paid' => 1,
            'gym_id' => $defaultGymId,
            'password' => Hash::make('password'),
        ]);

        $this->createUserWithLogs([
            'first_name' => 'Sara',
            'last_name' => 'Ahmed',
            'email' => 'sara@example.com',
            'phone_number' => '03007654321',
            'is_admin' => 0,
            'is_paid' => 0,
            'gym_id' => $defaultGymId,
            'password' => Hash::make('password'),
        ]);

        for ($i = 0; $i < 10; $i++) {
            $this->createUserWithLogs([
                'first_name' => $faker->firstName,
                'last_name' => $faker->lastName,
                'email' => $faker->unique()->safeEmail,
                'phone_number' => '03' . $faker->numberBetween(100000000, 999999999),
                'is_admin' => 0,
                'is_paid' => $faker->boolean(),
                'gym_id' => $defaultGymId,
                'password' => Hash::make('password'),
            ]);
        }
    }

    protected function createUserWithLogs(array $attributes)
    {
        // Check if user with this email already exists
        $existingUser = User::where('email', $attributes['email'])->first();
        if ($existingUser) {
            // Agar user already hai, to wapis existing user return karo, aur naya create na karo
            return $existingUser;
        }

        $user = User::create(array_merge($attributes, [
            'email_verified_at' => now(),
            'remember_token' => Str::random(10),
        ]));

        // Create Activity Log
        ActivityLog::create([
            'user_id' => $user->id,
            'activity_type' => 'Seeder Creation',
            'description' => 'User created via seeder',
            // 'timestamp' => now(),
        ]);

        // Create Payment History if user is paid
        if ($user->is_paid) {
            PaymentHistory::create([
                'user_id' => $user->id,
                'amount' => 2000, // fixed amount or $faker use kar sakte hain agar chahein
                'paid_at' => now(),
                'payment_method' => 'Seeder Method',
                'status' => 'completed',
            ]);
        }

        return $user;
    }
}
