<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Checkin extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'checkin_time',
        'gym_id',
    ];

    protected $casts = [
        'checkin_time' => 'datetime',
    ];

    // Relationship with User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
