<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlanFeature extends Model
{
    use HasFactory;

    protected $fillable = [
        'subscription_plan_id',  // Changed from plan_id to match relationship
        'name',
        'description',
        'limit',
        'enabled'
    ];

    protected $casts = [
        'enabled' => 'boolean',
        'limit' => 'integer'
    ];

    protected $appends = ['is_unlimited'];

    public function toArray()
    {
        return [
            'id' => $this->id,
            'subscription_plan_id' => $this->subscription_plan_id, // Updated field name
            'name' => $this->name,
            'description' => $this->description,
            'limit' => $this->limit,
            'is_unlimited' => $this->is_unlimited,
            'enabled' => $this->enabled,
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
        ];
    }

    public function getIsUnlimitedAttribute()
    {
        return is_null($this->limit);
    }

    public function plan()
    {
        return $this->belongsTo(SubscriptionPlan::class);
        // Removed the second parameter since we're now using proper column name
    }
}