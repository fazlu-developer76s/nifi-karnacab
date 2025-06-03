<?php

// app/Mail/OtpMail.php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OtpMail extends Mailable
{
    use Queueable, SerializesModels;

    public $otp;
    public $fromEmail;
    public $fromName;
    public $replyEmail;

    /**
     * Create a new message instance.
     *
     * @param string $otp
     * @return void
     */
    public function __construct($otp,$fromEmail,$fromName,$replyEmail)
    {
        $this->otp = $otp;
        $this->fromEmail = $fromEmail;
        $this->fromName = $fromName;
        $this->replyEmail = $replyEmail;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.otp') // specify the view for the email
        ->subject('Your OTP Code') // set the email subject
        ->with('otp', $this->otp) // pass OTP to the view
        ->from($this->fromEmail, $this->fromName) // From address
        ->replyTo($this->replyEmail, $this->fromName); // Reply-To address
    }
}
