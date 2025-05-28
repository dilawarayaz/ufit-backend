<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call([
            GymSeeder::class,
            SubscriptionPlanSeeder::class,
            RegionSeeder::class,
            VisitSeeder::class,
            ReviewSeeder::class,
            AdminUserSeeder::class,
            CheckinSeeder::class,   
            
        ]);
    }
}
