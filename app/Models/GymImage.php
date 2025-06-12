<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GymImage extends Model
{
    use HasFactory;
     protected $fillable = ['gym_id', 'image_path'];
      public function gym()
    {
        return $this->belongsTo(Gym::class);
    }


       public function getImagePathAttribute()
{
    $filename = $this->attributes['image_path'] ?? null;

    if (!$filename) {
        return null;
    }

    return url(asset('uploads/gyms/').'/'.$filename);
}

}
