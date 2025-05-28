<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'description'];

    // Relationship with Gyms
    public function gyms()
    {
        return $this->hasMany(Gym::class);
    }

    // Relationship with CheckIns through Gyms
    public function checkIns()
    {
        return $this->hasManyThrough(Checkin::class, Gym::class);
    }

    // Relationship with UserSubscriptions through Gyms
    public function userSubscriptions()
    {
        return $this->hasManyThrough(UserSubscription::class, Gym::class);
    }
}