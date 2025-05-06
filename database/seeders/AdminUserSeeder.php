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
                'first_name'   => 'Admin',
                'last_name'    => 'jao',
                'email'        => 'admin@gym.com',
                'phone_number' => '03001234567', // Add your desired phone number
                'password'     => bcrypt('12345678'),
                'is_admin'     => 1,
            ]);
        }
    }
}
