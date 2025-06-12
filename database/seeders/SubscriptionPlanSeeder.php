<?php

namespace Database\Seeders;

use App\Models\PlanFeature;
use App\Models\SubscriptionPlan;
use App\Models\Gym;
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
        DB::table('gym_plan')->truncate();

        // Get all approved gyms
        $approvedGyms = Gym::where('status', 'approved')->get();
        $totalApprovedGyms = $approvedGyms->count();

        if ($totalApprovedGyms < 30) {
            $this->command->error("Need at least 30 approved gyms to seed plans properly. Found only {$totalApprovedGyms}.");
            return;
        }

        // Create Basic Gym Membership (access to 10 random gyms)
        $basic = SubscriptionPlan::create([
            'name' => 'Basic Membership',
            'monthly_price' => 29.99,
            'annual_price' => 29.99 * 12, // Calculate annual price
            'status' => 'active'
        ]);

        // Add features to basic plan
        $basic->features()->createMany([
            [
                'name' => 'Gym Access',
                'description' => 'Access to selected gym equipment',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Locker Usage',
                'description' => 'Daily locker rental',
                'limit' => 30,
                'enabled' => true
            ],
            [
                'name' => 'Fitness Classes',
                'description' => 'Weekly group classes',
                'limit' => 4,
                'enabled' => true
            ]
        ]);

        // Attach 10 random approved gyms to basic plan
        $basic->gyms()->attach($approvedGyms->random(10)->pluck('id'));

        // Create Standard Gym Membership (access to 30 random gyms)
        $standard = SubscriptionPlan::create([
            'name' => 'Standard Membership',
            'monthly_price' => 49.99,
            'annual_price' => 49.99 * 12, // Calculate annual price
            'status' => 'active'
        ]);

        // Add features to standard plan
        $standard->features()->createMany([
            [
                'name' => 'Extended Gym Access',
                'description' => 'Access to premium equipment',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Personal Locker',
                'description' => 'Weekly locker rental',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Unlimited Classes',
                'description' => 'All standard fitness classes',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Trainer Consultation',
                'description' => 'Monthly trainer session',
                'limit' => 1,
                'enabled' => true
            ]
        ]);

        // Attach 30 random approved gyms to standard plan
        $standard->gyms()->attach($approvedGyms->random(30)->pluck('id'));

        // Create Premium Gym Membership (access to all approved gyms)
        $premium = SubscriptionPlan::create([
            'name' => 'Premium Membership',
            'monthly_price' => 79.99,
            'annual_price' => 79.99 * 12, // Calculate annual price
            'status' => 'active'
        ]);

        // Add features to premium plan
        $premium->features()->createMany([
            [
                'name' => 'All Gym Access',
                'description' => 'Access to all partner gyms',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'VIP Locker',
                'description' => 'Permanent locker',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Unlimited Premium Classes',
                'description' => 'All classes including premium',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Personal Trainer',
                'description' => 'Weekly sessions',
                'limit' => 4,
                'enabled' => true
            ],
            [
                'name' => 'Spa Facilities',
                'description' => 'Sauna and steam room access',
                'limit' => null,
                'enabled' => true
            ]
        ]);

        // Attach all approved gyms to premium plan
        $premium->gyms()->attach($approvedGyms->pluck('id'));

        // Create Student Membership (access to 5 random gyms)
        $student = SubscriptionPlan::create([
            'name' => 'Student Plan',
            'monthly_price' => 19.99,
            'annual_price' => 19.99 * 12, // Calculate annual price
            'status' => 'active'
        ]);

        // Add features to student plan
        $student->features()->createMany([
            [
                'name' => 'Limited Gym Access',
                'description' => 'Access during student hours',
                'limit' => null,
                'enabled' => true
            ],
            [
                'name' => 'Locker Usage',
                'description' => 'Daily locker rental',
                'limit' => 15,
                'enabled' => true
            ],
            [
                'name' => 'Basic Classes',
                'description' => 'Selected fitness classes',
                'limit' => 2,
                'enabled' => true
            ]
        ]);

        // Attach 5 random approved gyms to student plan
        $student->gyms()->attach($approvedGyms->random(5)->pluck('id'));

        $this->command->info('Successfully seeded 4 subscription plans with:');
        $this->command->info('- Premium: All '.$totalApprovedGyms.' approved gyms');
        $this->command->info('- Standard: 30 random gyms');
        $this->command->info('- Basic: 10 random gyms');
        $this->command->info('- Student: 5 random gyms');
    }
}