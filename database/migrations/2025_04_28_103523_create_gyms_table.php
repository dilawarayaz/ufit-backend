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
        Schema::create('gyms', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // Gym name
            $table->string('address'); // Gym address
            $table->string('phone'); // Gym phone number
            $table->string('email'); // Gym email
            $table->time('opening_time'); // Gym opening time
            $table->time('closing_time'); // Gym closing time
            $table->text('description')->nullable(); // Optional gym description
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('gyms');
    }
};
