<?php
// database/migrations/xxxx_xx_xx_xxxxxx_create_gym_visits_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('gym_visits', function (Blueprint $table) {
            $table->id();
            $table->foreignId('gym_id')->constrained()->onDelete('cascade');
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->timestamp('check_in_at');
            $table->timestamp('check_out_at')->nullable();
            $table->integer('duration_minutes')->nullable();
            $table->timestamps();
            
            $table->index(['gym_id', 'user_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('gym_visits');
    }
};