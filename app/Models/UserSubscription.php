<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserSubscription extends Model
{
    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',  
        'is_active' => 'boolean'
    ];
    
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function plan()
    {
        return $this->belongsTo(SubscriptionPlan::class);
    }

      public function renewals()
    {
        return $this->hasMany(self::class, 'previous_subscription_id');
    }

    // Define the previous subscription relationship
    public function previousSubscription()
    {
        return $this->belongsTo(self::class, 'previous_subscription_id');
    }
    // Define relationship to Gym
    public function gym()
    {
        return $this->belongsTo(Gym::class);
    }

    // Define relationship to User
  
}
