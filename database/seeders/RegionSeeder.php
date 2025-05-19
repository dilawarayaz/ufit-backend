<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Region;

class RegionSeeder extends Seeder
{
    public function run()
    {
        // Delete existing records
        Region::truncate();

        // Create sample regions
        $regions = [
            ['name' => 'North Region', 'description' => 'Northern areas of the country'],
            ['name' => 'South Region', 'description' => 'Southern areas of the country'],
            ['name' => 'East Region', 'description' => 'Eastern areas of the country'],
            ['name' => 'West Region', 'description' => 'Western areas of the country'],
            ['name' => 'Central Region', 'description' => 'Central areas of the country'],
        ];

        foreach ($regions as $region) {
            Region::create($region);
        }

        $this->command->info('Regions seeded successfully!');
    }
}