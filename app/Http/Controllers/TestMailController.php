<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Mail;

class TestMailController extends Controller
{
    public function sendTestEmail()
    {
        $details = [
            'subject' => 'Test Email from TateClips',
            'body' => 'Congratulations! Your SMTP is working perfectly.'
        ];

        Mail::raw($details['body'], function ($message) use ($details) {
            $message->to('zawarappdeveloper@gmail.com') // Apni email likhein jahan test bhejna hai
                    ->subject($details['subject']);
        });

        return response()->json(['message' => 'Test email sent successfully']);
    }
}
