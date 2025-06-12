<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class SubscriptionPlan extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'monthly_price', // This should be your base price
        'status',
        'description'
    ];


    protected $hidden = [
        'deleted_at'
    ];

    protected $appends = ['annual_price'];

  
    protected $casts = [
        'monthly_price' => 'decimal:2', // Cast monthly_price instead of price
    ];

   
public function toArray()
{
    // Explicitly load relationships if not already loaded
    if (!$this->relationLoaded('features')) {
        $this->load(['features' => function($query) {
            $query->where('enabled', true);
        }]);
    }
    
    if (!$this->relationLoaded('gyms')) {
        $this->load(['gyms' => function($query) {
            $query->select('gyms.id', 'name', 'address', 'image_path', 'status')
                  ->where('status', 'approved');
        }]);
    }

    return [
        'id' => $this->id,
        'name' => $this->name,
        'monthly_price' => $this->monthly_price,
        'annual_price' => $this->annual_price,
        'status' => $this->status,
        'description' => $this->description,
        'features' => $this->features->map(function($feature) {
            return [
                'name' => $feature->name,
                'description' => $feature->description,
                'limit' => $feature->limit,
                'is_unlimited' => $feature->is_unlimited
            ];
        }),
        'gyms' => $this->gyms->map(function($gym) {
            return [
                'id' => $gym->id,
                'name' => $gym->name,
                'address' => $gym->address,
                'image_path' => $gym->image_path,
                'status' => $gym->status
                // Add more fields as needed from your fillable list
            ];
        }),
        'gyms_count' => $this->gyms_count ?? null,
        'features_count' => $this->features_count ?? null,
        'created_at' => $this->created_at->toDateTimeString(),
        'updated_at' => $this->updated_at->toDateTimeString(),
    ];
}

      public function getAnnualPriceAttribute()
    {
        return $this->monthly_price * 12; // Calculate from monthly_price
    }

    public function features(): HasMany
    {
        return $this->hasMany(PlanFeature::class);
    }
   public function gyms()
{
    return $this->belongsToMany(Gym::class, 'gym_plan', 'subscription_plan_id', 'gym_id');
}

}    
