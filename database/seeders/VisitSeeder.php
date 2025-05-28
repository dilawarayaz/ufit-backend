<?php
namespace Database\Seeders;

use App\Models\GymVisit;
use Illuminate\Database\Seeder;
use App\Models\Visit;
use App\Models\Gym;
use App\Models\User;
use Faker\Factory as Faker;

class VisitSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        $users = User::pluck('id')->toArray();
        $gyms = Gym::pluck('id')->toArray();

        foreach ($gyms as $gymId) {
            for ($i = 0; $i < rand(5, 20); $i++) {
                GymVisit::create([
                    'user_id' => $faker->randomElement($users),
                    'gym_id' => $gymId,
                    'check_in_at' => $faker->dateTimeBetween('-6 months', 'now'),
                ]);
            }
        }
    }
}
