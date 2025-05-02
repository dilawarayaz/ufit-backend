<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    // Specify the table if it's not the default 'payments'
    protected $table = 'payments';  // If the table name is different, set it here

    // Define the fillable fields for mass assignment
    protected $fillable = [
        'user_id',   // or any other columns
        'amount',    // assuming the 'amount' column stores the payment value
        'status',    // assuming you have a 'status' field for payment status
        'created_at',
        'updated_at',  
    ];

    // Optionally, you can define relationships if needed
}
