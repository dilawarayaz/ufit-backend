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
    
    // Creates user_id column with FK to users.id and cascade on delete
    $table->integer('user_id');
    
    // Creates gym_id column with FK to gyms.id, nullable and set null on delete
    $table->integer('gym_id');

    $table->string('subscription_type', 50);
    $table->boolean('is_active')->default(true);
    $table->date('start_date');
    $table->date('end_date');
    $table->decimal('price', 10, 2)->nullable();
    $table->string('payment_status', 20)->default('pending');
    $table->string('billing_cycle', 20)->nullable();
    $table->text('notes')->nullable();
    
    $table->timestamps();
    $table->softDeletes();
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
