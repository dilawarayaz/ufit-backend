<?php
namespace Database\Seeders;

use App\Models\User;
use App\Models\UserSubscription;
use App\Models\Gym;
use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSubscriptionSeeder extends Seeder
{
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        UserSubscription::truncate();

        try {
            $users = User::take(10)->get();
            $gymIds = Gym::pluck('id')->toArray(); // Fetch all gym IDs

            if ($users->isEmpty()) {
                throw new \Exception("No users found. Please seed users first.");
            }

            if (empty($gymIds)) {
                throw new \Exception("No gyms found. Please seed gyms first.");
            }

            $subscriptionPlans = [
                'basic'   => 9.99,
                'premium' => 19.99,
                'gold'    => 29.99,
            ];

            $now = Carbon::now();

            foreach ($users as $user) {
                $randomGymId = $gymIds[array_rand($gymIds)];

                // Active subscription
                UserSubscription::create([
                    'user_id' => $user->id,
                    'gym_id' => $randomGymId,
                    'subscription_type' => 'premium',
                    'price' => $subscriptionPlans['premium'],
                    'is_active' => true,
                    'start_date' => $now,
                    'end_date' => $now->copy()->addMonth(),
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);

                // Expired subscription
                $randomGymId = $gymIds[array_rand($gymIds)];
                UserSubscription::create([
                    'user_id' => $user->id,
                    'gym_id' => $randomGymId,
                    'subscription_type' => 'basic',
                    'price' => $subscriptionPlans['basic'],
                    'is_active' => false,
                    'start_date' => $now->copy()->subMonths(2),
                    'end_date' => $now->copy()->subMonth(),
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);

                // Optional random
                if (rand(0, 1)) {
                    $type = array_rand($subscriptionPlans);
                    $randomGymId = $gymIds[array_rand($gymIds)];
                    UserSubscription::create([
                        'user_id' => $user->id,
                        'gym_id' => $randomGymId,
                        'subscription_type' => $type,
                        'price' => $subscriptionPlans[$type],
                        'is_active' => (bool) rand(0, 1),
                        'start_date' => $now->copy()->subDays(rand(1, 10)),
                        'end_date' => $now->copy()->addDays(rand(15, 60)),
                        'created_at' => $now,
                        'updated_at' => $now,
                    ]);
                }
            }

            $this->command->info('✅ Successfully seeded user subscriptions with gym_id!');
            $this->command->info('🔵 Active subscriptions: ' . UserSubscription::where('is_active', true)->count());
            $this->command->info('⚫ Expired subscriptions: ' . UserSubscription::where('is_active', false)->count());

        } catch (\Exception $e) {
            $this->command->error('❌ Error seeding subscriptions: ' . $e->getMessage());
        } finally {
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        }
    }
}
