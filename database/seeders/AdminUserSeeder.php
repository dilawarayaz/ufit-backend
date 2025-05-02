<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class AdminUserSeeder extends Seeder
{
    public function run()
    {
        // Check if admin already exists to avoid duplicate entries
        $adminExists = User::where('email', 'admin@gym.com')->first();

        if (!$adminExists) {
            User::create([
                'first_name' => 'Admin',
                'last_name' => 'jao',
                'email' => 'admin@gym.com',
                'password' => bcrypt('12345678'), // Admin ka password
                'is_admin' => 1,
            ]);
        }
    }
}
