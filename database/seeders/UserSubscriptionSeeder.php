<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\UserSubscription;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSubscriptionSeeder extends Seeder
{
    public function run()
    {
        // Disable foreign key checks for smoother seeding
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        UserSubscription::truncate(); // Clear existing data
        
        try {
            // Get users who will get subscriptions (minimum 10)
            $users = User::take(10)->get();
            
            if ($users->isEmpty()) {
                throw new \Exception("No users found. Please seed users first.");
            }

            $subscriptionTypes = ['basic', 'premium', 'gold'];
            $now = Carbon::now();

            foreach ($users as $user) {
                // Create active subscription
                UserSubscription::create([
                    'user_id' => $user->id,
                    'subscription_type' => 'premium',
                    'is_active' => true,
                    'start_date' => $now,
                    'end_date' => $now->copy()->addMonth(),
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
                
                // Create expired subscription
                UserSubscription::create([
                    'user_id' => $user->id,
                    'subscription_type' => 'basic',
                    'is_active' => false,
                    'start_date' => $now->copy()->subMonths(2),
                    'end_date' => $now->copy()->subMonth(),
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);

                // Optional: Add random active subscription
                if (rand(0, 1)) { // 50% chance
                    UserSubscription::create([
                        'user_id' => $user->id,
                        'subscription_type' => $subscriptionTypes[array_rand($subscriptionTypes)],
                        'is_active' => (bool) rand(0, 1),
                        'start_date' => $now->copy()->subDays(rand(1, 10)),
                        'end_date' => $now->copy()->addDays(rand(15, 60)),
                        'created_at' => $now,
                        'updated_at' => $now,
                    ]);
                }
            }

            $this->command->info('Successfully seeded user subscriptions!');
            $this->command->info('Active subscriptions: '.UserSubscription::where('is_active', true)->count());
            $this->command->info('Expired subscriptions: '.UserSubscription::where('is_active', false)->count());

        } catch (\Exception $e) {
            $this->command->error('Error seeding subscriptions: '.$e->getMessage());
        } finally {
            // Re-enable foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        }
    }
}