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

        // Sample gym images from Unsplash
        $allGymImages = [
            'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=800',
            'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=800',
            'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=800',
            'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=800',
            'https://images.unsplash.com/photo-1551632811-561732d1e306?w=800',
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800',
            'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=800',
            'https://images.unsplash.com/photo-1576678927484-cc907957088c?w=800',
            'https://images.unsplash.com/photo-1579758626648-3b8f6d60ee82?w=800',
            'https://images.unsplash.com/photo-1594381898411-846e7d193883?w=800',
            'https://images.unsplash.com/photo-1596357395217-80de13137eac?w=800',
            'https://images.unsplash.com/photo-1605296867424-35fc25c9212a?w=800',
        ];

        $facilityOptions = ['Cardio', 'Weights', 'Swimming Pool', 'Sauna', 'CrossFit', 'Yoga Studio', 'Personal Trainer'];
        $amenityOptions = ['Locker Room', 'Shower', 'Towel Service', 'WiFi', 'Juice Bar', 'Parking', 'Childcare'];

        foreach (range(1, 50) as $i) {
            $latitude = $faker->latitude(24.8, 25.0); // Karachi-like range
            $longitude = $faker->longitude(66.8, 67.3);

            // Select 3-5 random images for each gym
            $gymImages = json_encode($faker->randomElements($allGymImages, rand(3, 5)));

            Gym::create([
                'name' => $faker->company . ' Gym',
                'address' => $faker->address,
                'opening_time' => $faker->randomElement(['05:00', '06:00', '07:00']),
                'closing_time' => $faker->randomElement(['21:00', '22:00', '23:00', '00:00']),
                'description' => $faker->paragraph(3),
                'facilities' => json_encode($faker->randomElements($facilityOptions, rand(2, 5))),
                'amenities' => json_encode($faker->randomElements($amenityOptions, rand(2, 4))),
                'commission_rate' => $faker->randomFloat(2, 5, 20),
                'latitude' => $latitude,
                'longitude' => $longitude,
                'status' => $faker->randomElement(['approved', 'pending', 'rejected']),
                'region_id' => $faker->randomElement($regionIds),
                'image_path' => $gymImages, // Now storing multiple images as JSON
                'owner_id' => $faker->randomElement($ownerIds),
                'payment_settings' => json_encode([
                    'cash' => $faker->boolean(80),
                    'credit_card' => $faker->boolean(90),
                    'bank_transfer' => $faker->boolean(60),
                    'mobile_payment' => $faker->boolean(70),
                ]),
            ]);
        }

        $this->command->info('✅ 50 gyms seeded successfully with multiple images each.');
    }
}