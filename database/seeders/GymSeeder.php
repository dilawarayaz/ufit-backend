<?php

namespace Database\Seeders;

use App\Models\Gym;
use App\Models\Region;
use App\Models\User; // If owners are users
use Faker\Factory;
use Illuminate\Database\Seeder;

class GymSeeder extends Seeder
{
    public function run()
    {
        $faker = Factory::create();

        // Get all region IDs
        $regionIds = Region::pluck('id')->toArray();

        // Get all user IDs to assign as owners
        $ownerIds = User::pluck('id')->toArray();

        if (empty($regionIds)) {
            $this->command->error('No regions found. Please seed regions before gyms.');
            return;
        }

        if (empty($ownerIds)) {
            $this->command->error('No owners found. Please seed users before gyms.');
            return;
        }

        $sampleImages = [
            'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400',
            'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400',
            'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400',
            'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400',
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
        ];

        $statuses = ['approved', 'pending'];

        for ($i = 0; $i < 20; $i++) {
            $imageUrl = $sampleImages[array_rand($sampleImages)];
            $status = $statuses[$i % 2];

            Gym::create([
                'region_id' => $regionIds[array_rand($regionIds)],
                'owner_id' => $ownerIds[array_rand($ownerIds)], // ✅ Owner assigned here
                'name' => $faker->company . ' Gym',
                'address' => $faker->address,
                'phone' => $faker->phoneNumber,
                'email' => $faker->companyEmail,
                'opening_time' => $faker->time('H:i', '06:00'),
                'closing_time' => $faker->time('H:i', '22:00'),
                'description' => $faker->paragraph(3),
                'image_path' => $imageUrl,
                'facilities' => json_encode([
                    'Cardio Machines',
                    'Weight Lifting',
                    'Personal Training',
                    'Yoga Classes'
                ]),
                'status' => $status,
                'commission_rate' => $faker->randomFloat(2, 5, 20),
                'payment_settings' => json_encode([
                    'paypal' => true,
                    'stripe' => false,
                ]),
                'latitude' => $faker->latitude,
                'longitude' => $faker->longitude,
            ]);

            $this->command->info("Created gym {$i} with owner and status: {$status}");
        }
    }
}
