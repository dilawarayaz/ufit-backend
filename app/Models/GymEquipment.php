<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GymEquipment extends Model
{
    use HasFactory;

    protected $fillable = [
        'gym_id',
        'name',
        'category',
        'quantity',
        'description',
        'condition',
        'last_maintenance_date'
    ];

    protected $casts = [
        'last_maintenance_date' => 'date',
    ];

    public function gym()
    {
        return $this->belongsTo(Gym::class);
    }
}