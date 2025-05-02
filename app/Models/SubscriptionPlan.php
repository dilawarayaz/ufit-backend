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
        'price',
        'status',
        'description'
    ];

    protected $hidden = [
        'deleted_at'
    ];

    protected $appends = ['annual_price'];

    protected $casts = [
        'price' => 'decimal:2',
    ];

    public function toArray()
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'monthly_price' => $this->price,
            'annual_price' => $this->annual_price,
            'status' => $this->status,
            'description' => $this->description,
            'features' => $this->features->where('enabled', true)->map(function($feature) {
                return [
                    'name' => $feature->name,
                    'description' => $feature->description,
                    'limit' => $feature->limit
                ];
            }),
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
        ];
    }

    public function getAnnualPriceAttribute()
    {
        return $this->price * 12;
    }

    public function features(): HasMany
    {
        return $this->hasMany(PlanFeature::class);
    }
}