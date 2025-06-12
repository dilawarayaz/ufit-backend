<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Enrollment extends Model
{
    use HasFactory;

   protected $fillable = [
        'user_id',
        'gym_id',          // Add this
        'subscription_id', // Add this
        'start_date',      // Add this
        'end_date',        // Add this
        'status'           // Add this
    ];


    public function user()
{
    return $this->belongsTo(User::class);
}
 public function subscription()
    {
        return $this->belongsTo(UserSubscription::class, 'subscription_id');
    }
}
