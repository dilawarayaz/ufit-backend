<?php
// database/migrations/xxxx_xx_xx_xxxxxx_create_gym_equipment_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('gym_equipment', function (Blueprint $table) {
            $table->id();
            $table->foreignId('gym_id')->constrained()->onDelete('cascade');
            $table->string('name');
            $table->string('category');
            $table->integer('quantity')->default(1);
            $table->text('description')->nullable();
            $table->string('condition')->default('good');
            $table->date('last_maintenance_date')->nullable();
            $table->timestamps();
            
            $table->index(['gym_id', 'category']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('gym_equipment');
    }
};