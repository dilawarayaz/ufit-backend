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
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('subscription_type', 50);
            $table->boolean('is_active')->default(true);
            $table->date('start_date');
            $table->date('end_date');
            $table->decimal('price', 10, 2)->nullable(); // Added for payment tracking
            $table->string('payment_status', 20)->default('pending'); // Added for payment tracking
            $table->string('billing_cycle', 20)->nullable(); // monthly/yearly etc.
            $table->text('notes')->nullable();
            $table->timestamps();
            $table->softDeletes(); // For archiving subscriptions
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
