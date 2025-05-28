<?php
namespace Database\Seeders;

use App\Models\GymReview;
use Illuminate\Database\Seeder;
use App\Models\Review;
use App\Models\Gym;
use App\Models\User;
use Faker\Factory as Faker;

class ReviewSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        $users = User::pluck('id')->toArray();
        $gyms = Gym::pluck('id')->toArray();

        foreach ($gyms as $gymId) {
            for ($i = 0; $i < rand(3, 10); $i++) {
                GymReview::create([
                    'user_id' => $faker->randomElement($users),
                    'gym_id' => $gymId,
                    'rating' => rand(1, 5),
                    'comment' => $faker->sentence,
                ]);
            }
        }
    }
}
