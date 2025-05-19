<?php

namespace Database\Seeders;

use App\Models\Checkin;
use App\Models\User;
use Illuminate\Database\Seeder;
use Carbon\Carbon;

class CheckinSeeder extends Seeder
{
    public function run()
    {
        $users = User::all();

        if ($users->isEmpty()) {
            $this->command->warn('No users found. Please seed users first.');
            return;
        }

        foreach ($users as $user) {
            // Random 1–5 check-ins per user
            $checkinCount = rand(1, 5);

            for ($i = 0; $i < $checkinCount; $i++) {
                Checkin::create([
                    'user_id' => $user->id,
                    'gym_id' => rand(1, 5), // Random gym_id between 1 and 5
                    'checkin_time' => Carbon::now()->subDays(rand(0, 10))->setTime(rand(8, 11), rand(0, 59)),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        $this->command->info('Check-in data seeded successfully with gym_id!');
    }
}
