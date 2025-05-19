<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MarketingToolController extends Controller
{
    public function emailCampaigns()
    {
        return view('admin.marketing.email-campaigns');
    }

    public function pushNotifications()
    {
        return view('admin.marketing.push-notifications');
    }
}