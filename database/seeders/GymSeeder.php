<?php

namespace Database\Seeders;

use App\Models\Gym;
use Faker\Factory;
use Illuminate\Database\Seeder;

class GymSeeder extends Seeder
{
    public function run()
    {
        $faker = Factory::create();

        $sampleImages = [
            'https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=400',
            'https://images.unsplash.com/photo-1545205597-3d9d02c29597?w=400',
            'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=400',
            'https://images.unsplash.com/photo-1534258936925-c58bed479fcb?w=400',
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
        ];

        for ($i = 0; $i < 20; $i++) {
            $imageUrl = $sampleImages[array_rand($sampleImages)];

            Gym::create([
                'name' => $faker->company.' Gym',
                'address' => $faker->address,
                'phone' => $faker->phoneNumber,
                'email' => $faker->companyEmail,
                'opening_time' => $faker->time('H:i', '06:00'),
                'closing_time' => $faker->time('H:i', '22:00'),
                'description' => $faker->paragraph(3),
                'image_path' => $imageUrl, // ✅ Just use the URL
            ]);

            $this->command->info("Created gym {$i} with image URL: {$imageUrl}");
        }
    }
}
