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
        'phone',
        'email',
        'opening_time',
        'closing_time',
        'description',
        'image_path',
        'facilities',
        'status', // 'pending', 'approved', 'rejected'
        'commission_rate',
        'payment_settings',
        'latitude',
        'longitude',
        'region_id'
    ];

    protected $casts = [
        'facilities' => 'array',
        'payment_settings' => 'json',
    ];

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

    public function region()
{
    return $this->belongsTo(Region::class);
}

public function checkIns()
{
    return $this->hasMany(CheckIn::class);
}

public function userSubscriptions()
{
    return $this->hasMany(UserSubscription::class);
}

public function users()
{
    return $this->hasMany(User::class);
}


}