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
        Schema::create('subscription_plans', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // The name of the subscription plan
            $table->string('status'); // Status of the subscription, e.g., 'active', 'inactive'
            $table->decimal('price', 8, 2); // Price of the subscription
            $table->timestamps(); // Created at and updated at timestamps
        });
    }
  
    
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subscription_plans');
    }
};
