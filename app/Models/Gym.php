<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gym extends Model
{
    use HasFactory;

    // Add 'name' and other fields you want to allow mass assignment for
    protected $fillable = [
        'name',
        'address',
        'phone',
        'email',
        'opening_time',
        'closing_time',
        'description',
        'image_path',
    ];

    public function favoredByUsers()
{
    return $this->belongsToMany(User::class, 'favorite_gyms')->withTimestamps();
}

}
   
