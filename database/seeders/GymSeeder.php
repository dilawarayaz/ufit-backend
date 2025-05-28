<?php

namespace Database\Seeders;

use App\Models\Gym;
use App\Models\Region;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use Faker\Factory;

class GymSeeder extends Seeder
{
    public function run()
    {
        $faker = Factory::create();

        $regionIds = Region::pluck('id')->toArray();
        $ownerIds = User::pluck('id')->toArray();

        if (empty($regionIds)) {
            $this->command->error('No regions found. Please seed regions first.');
            return;
        }

        if (empty($ownerIds)) {
            $this->command->error('No users found. Please seed users first.');
            return;
        }

        $sampleImages = [
            'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400',
            'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400',
            'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400',
            'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400',
        ];

        $facilityOptions = ['Cardio', 'Weights', 'Swimming Pool', 'Sauna', 'CrossFit', 'Yoga Studio', 'Personal Trainer'];

        foreach (range(1, 50) as $i) {
            $latitude = $faker->latitude(24.8, 25.0); // Karachi-like range
            $longitude = $faker->longitude(66.8, 67.3);

            Gym::create([
                'name' => $faker->company . ' Gym',
                'address' => $faker->address,
                'opening_time' => '06:00',
                'closing_time' => '23:00',
                'description' => $faker->paragraph,
                'facilities' => json_encode($faker->randomElements($facilityOptions, rand(2, 5))),
                'commission_rate' => $faker->randomFloat(2, 5, 20),
                'latitude' => $latitude,
                'longitude' => $longitude,
                'status' => $faker->randomElement(['approved', 'pending', 'rejected']),
                'region_id' => $faker->randomElement($regionIds),
                'image_path' => $faker->randomElement($sampleImages),
                'owner_id' => $faker->randomElement($ownerIds),
            ]);
        }

        $this->command->info('✅ 50 gyms seeded successfully.');
    }
}
