<?php
// database/migrations/xxxx_xx_xx_xxxxxx_create_gym_reviews_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('gym_reviews', function (Blueprint $table) {
            $table->id();
            $table->foreignId('gym_id')->constrained()->onDelete('cascade');
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->integer('rating')->unsigned();
            $table->text('comment')->nullable();
            $table->boolean('approved')->default(false);
            $table->timestamps();
            
            $table->index(['gym_id', 'user_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('gym_reviews');
    }
};