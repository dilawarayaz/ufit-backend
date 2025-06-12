<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   // In the migration file
public function up()
{
    Schema::create('enrollments', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('user_id');
        $table->unsignedBigInteger('gym_id');
        $table->unsignedBigInteger('subscription_id');
        $table->dateTime('start_date');
        $table->dateTime('end_date')->nullable();
        $table->string('status')->default('active'); // active, cancelled, expired
        $table->timestamps();

        $table->foreign('user_id')->references('id')->on('users');
        $table->foreign('gym_id')->references('id')->on('gyms');
        $table->foreign('subscription_id')->references('id')->on('user_subscriptions');
    });
}

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enrollments');
    }
};
