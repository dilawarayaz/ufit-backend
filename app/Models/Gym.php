<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gym extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'opening_time',
        'closing_time',
        'description',
        'image_path',
        'amenities',
        'facilities',
        'status',
        'commission_rate',
        'payment_settings',
        'latitude',
        'longitude',
        'region_id',
        'owner_id'
    ];

    protected $casts = [
        'facilities' => 'array',
        'amenities' => 'array',
        'payment_settings' => 'array',
    ];

public function subscriptionPlans()
{
    return $this->belongsToMany(SubscriptionPlan::class, 'gym_plan');
}

    public function favoredByUsers()
    {
        return $this->belongsToMany(User::class, 'favorite_gyms')->withTimestamps();
    }

    public function visits()
    {
        return $this->hasMany(GymVisit::class);
    }


    public function reviews()
    {
        return $this->hasMany(GymReview::class);
    }

    public function equipment()
    {
        return $this->hasMany(GymEquipment::class);
    }

    public function getAverageRatingAttribute()
    {
        return $this->reviews()->avg('rating');
    }

    public function getTotalVisitsAttribute()
    {
        return $this->visits()->count();
    }
    public function images()
    {
        return $this->hasMany(GymImage::class);
    }
    public function region()
    {
        return $this->belongsTo(Region::class);
    }

    public function checkIns()
    {
        return $this->hasMany(Checkin::class);
    }

    public function userSubscriptions()
    {
        return $this->hasMany(UserSubscription::class);
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }

    public function owner()
    {
        return $this->hasOne(User::class, 'id', 'owner_id');
    }

    // In App\Models\Gym

public function members()
{
    return $this->hasMany(User::class);
}

public function enrollments()
{
    return $this->hasMany(Enrollment::class);
}

// public function owner()
// {
//     return $this->belongsTo(User::class, 'owner_id'); // Adjust based on your schema
// }

}
