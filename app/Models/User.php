<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Kyslik\ColumnSortable\Sortable;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    use HasApiTokens, HasFactory, Notifiable, Sortable;

    public $sortable = ['id', 'first_name', 'last_name', 'email', 'created_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'phone_number',
        'email',
        'password',
        'role_id',  // Add this
        'gym_id',
        'profile_picture',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * User Subscriptions Relationship
     */

    public function subscriptions()
    {
        return $this->hasMany(UserSubscription::class);
    }

    public function favoriteGyms()
    {
        return $this->belongsToMany(Gym::class, 'favorite_gyms')->withTimestamps();
    }
    public function activeSubscriptions()
    {
        return $this->hasMany(UserSubscription::class)
            ->where('is_active', true)
            ->where(function ($query) {
                $query->where('end_date', '>', now())
                    ->orWhereNull('end_date');
            });
    }

    public function activityLogs()
    {
        return $this->hasMany(ActivityLog::class);  // Assuming you have ActivityLog model
    }

    public function paymenthistory()
    {
        return $this->hasMany(PaymentHistory::class);
    }

    // app/Models/User.php

    public function role()
    {
        return $this->belongsTo(Role::class);
    }
    public function gym()
{
    return $this->belongsTo(Gym::class);
}


}
