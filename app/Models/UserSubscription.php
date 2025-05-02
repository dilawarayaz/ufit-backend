<?php
// app/Models/UserSubscription.php
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
}