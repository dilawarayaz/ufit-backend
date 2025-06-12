<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewEnrollmentNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $user;
    public $gym;

    public function __construct($user, $gym)
    {
        $this->user = $user;
        $this->gym = $gym;
    }

    public function via($notifiable)
    {
        return ['database']; // Add 'mail' if email bhi send karna hai
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => 'New member enrolled: '.$this->user->name,
            'user_id' => $this->user->id,
            'gym_id' => $this->gym->id,
            'action_url' => "/gyms/{$this->gym->id}/members"
        ];
    }

    // Optional: Agar email bhi send karna ho
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('A new member has enrolled in your gym.')
                    ->action('View Member', url("/gyms/{$this->gym->id}/members"))
                    ->line('Thank you for using our application!');
    }
}