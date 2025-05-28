<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserSubscription extends Model
{
     protected $fillable = [
        'user_id',
        'gym_id',
        'plan_id',
        'subscription_type',
        'is_active',
        'start_date',
        'end_date',
        'price',
        'payment_status',
        'billing_cycle',
        'notes',
        'previous_subscription_id',
        'stripe_subscription_id',
        'stripe_customer_id',
        'last_payment_date'
    ];


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

    public function previousSubscription()
    {
        return $this->belongsTo(self::class, 'previous_subscription_id');
    }

    public function gym()
    {
        return $this->belongsTo(Gym::class);
    }
       public function isActive(): bool
    {
        return $this->is_active && 
               now()->between($this->start_date, $this->end_date);
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true)
                    ->where('start_date', '<=', now())
                    ->where('end_date', '>=', now());
    }
}
