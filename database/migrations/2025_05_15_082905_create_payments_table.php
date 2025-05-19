<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('user_id');      // User ka ID (foreign key)
            $table->unsignedBigInteger('gym_id')->nullable();  // Gym ka ID (optional)

            $table->decimal('amount', 10, 2);           // Payment amount
            $table->string('status')->default('pending');  // Status: pending, success, failed, refunded
            $table->string('payment_method')->nullable();  // Stripe, M-Pesa, Flutterwave, etc.
            $table->string('transaction_id')->nullable();  // Gateway ka transaction ID
            $table->text('notes')->nullable();              // Optional notes

            $table->timestamps();

            // Foreign keys (agar aap foreign key constraints lagana chahte hain)
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('gym_id')->references('id')->on('gyms')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
