<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_subscriptions', function (Blueprint $table) {
            $table->id();

            // Regular integer columns without foreign key constraints
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('gym_id')->nullable();
            $table->unsignedBigInteger('plan_id')->nullable();

            // Subscription details
            $table->string('subscription_type', 50);
            $table->boolean('is_active')->default(true);
            $table->date('start_date');
            $table->date('end_date');
            $table->decimal('price', 10, 2)->nullable();
            $table->string('payment_status', 20)->default('pending');
            $table->string('billing_cycle', 20)->nullable();
            $table->text('notes')->nullable();

            // For subscription renewals/changes
            $table->unsignedBigInteger('previous_subscription_id')->nullable();

            // Payment integration fields
            $table->string('stripe_subscription_id')->nullable();
            $table->string('stripe_customer_id')->nullable();
            $table->timestamp('last_payment_date')->nullable();

            $table->timestamps();
            $table->softDeletes();

            // Add indexes for better performance
            $table->index('user_id');
            $table->index('gym_id');
            $table->index('plan_id');
            $table->index('is_active');
            $table->index('end_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_subscriptions');
    }
};
