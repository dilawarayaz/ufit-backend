<?php

namespace Database\Seeders;

use App\Models\PlanFeature;
use App\Models\SubscriptionPlan;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubscriptionPlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        SubscriptionPlan::truncate();
        PlanFeature::truncate();

        // Create Basic Gym Membership
        $basic = SubscriptionPlan::create([
            'name' => 'Basic Membership',
            'price' => 29.99,
            'status' => 'active'
        ]);

        // Add features to basic plan
        $basic->features()->createMany([
            [
                'name' => 'Gym Access',
                'description' => 'Access to all gym equipment',
                'limit' => null
            ],
            [
                'name' => 'Locker Usage',
                'description' => 'Daily locker rental',
                'limit' => 30  // times per month
            ],
            [
                'name' => 'Fitness Classes',
                'description' => 'Weekly group classes',
                'limit' => 4  // per month
            ],
            [
                'name' => 'Trainer Consultation',
                'description' => 'Free trainer sessions',
                'limit' => 1  // per month
            ]
        ]);

        // Create Premium Gym Membership
        $premium = SubscriptionPlan::create([
            'name' => 'Premium Membership',
            'price' => 59.99,
            'status' => 'active'
        ]);

        // Add features to premium plan
        $premium->features()->createMany([
            [
                'name' => '24/7 Gym Access',
                'description' => 'Unlimited access all hours',
                'limit' => null
            ],
            [
                'name' => 'Personal Locker',
                'description' => 'Dedicated locker',
                'limit' => null
            ],
            [
                'name' => 'Unlimited Classes',
                'description' => 'All fitness classes included',
                'limit' => null
            ],
            [
                'name' => 'Personal Trainer',
                'description' => 'Weekly sessions',
                'limit' => 4  // per month
            ],
            [
                'name' => 'Sauna Access',
                'description' => 'Unlimited sauna usage',
                'limit' => null
            ]
        ]);

        // Create Family Gym Package
        $family = SubscriptionPlan::create([
            'name' => 'Family Package',
            'price' => 99.99,
            'status' => 'active'
        ]);

        // Add features to family plan
        $family->features()->createMany([
            [
                'name' => 'Family Members',
                'description' => 'Number of family members',
                'limit' => 4
            ],
            [
                'name' => 'Gym Access',
                'description' => 'Access for all members',
                'limit' => null
            ],
            [
                'name' => 'Kids Club',
                'description' => 'Childcare service',
                'limit' => 20  // hours per month
            ],
            [
                'name' => 'Swimming Pool',
                'description' => 'Pool access for family',
                'limit' => null
            ]
        ]);

        // Create Student Membership
        $student = SubscriptionPlan::create([
            'name' => 'Student Plan',
            'price' => 19.99,
            'status' => 'active'
        ]);

        // Add features to student plan
        $student->features()->createMany([
            [
                'name' => 'Gym Access',
                'description' => 'Access during student hours',
                'limit' => null
            ],
            [
                'name' => 'Locker Usage',
                'description' => 'Daily locker rental',
                'limit' => 15  // times per month
            ],
            [
                'name' => 'Basic Classes',
                'description' => 'Selected fitness classes',
                'limit' => 2  // per month
            ]
        ]);

        $this->command->info('Gym subscription plans and features seeded successfully!');
    }
}