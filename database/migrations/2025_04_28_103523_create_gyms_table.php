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

            // Foreign key for region
            $table->integer('region_id');
            $table->integer('owner_id');
            $table->string('name');
            $table->string('address');
            $table->time('opening_time');
            $table->time('closing_time');
            $table->text('description')->nullable();
            $table->string('image_path')->nullable(); // For image storage

            // Additional fields
            $table->json('facilities')->nullable();
            $table->string('status')->default('pending'); // 'pending', 'approved', 'rejected'
            $table->decimal('commission_rate', 5, 2)->default(0);
            $table->json('payment_settings')->nullable();
            $table->decimal('latitude', 10, 7)->nullable();
            $table->decimal('longitude', 10, 7)->nullable();

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
