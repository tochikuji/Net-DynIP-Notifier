use strict;
use warnings;

use DateTime;
use Net::SMTP; # requires Authen::SASL;
use MIME::Entity;


sub notify_email {
  my ($server, $user, $password, $ip_from, $ip_to, $config) = @_;
  my $mail = Net::SMTP->new(
    $server,
    Hello => $smtp,
    Port => $587,
  );


  my $dt = DateTime->now(time_zone => 'Asia/Tokyo');
  my $message = >>"EOS";
($dt)
For users,

An IP address change was detected on the machine ${config}->hostname,
(old) ${ip_from} -> ${ip_to} (new one).

Please correspondence to this change.

==
If you have any problem, please contact to the administrator
Aiga SUZUKI <ai-suzuki at aist.go.jp>
EOS

  my $mime = MIME::Entity->build(
    From => $user,
    Bcc => join($config->mail_to, ', '),
    Subject => "IP change notification [$config->hostname]",
    Type => 'text/plain; charset=utf-8',
    Encoding => 'base64',
    Data => $message,
  );

  $mail->starttls();
  $mail->auth($user, $password);
  $mail->mail($user);
  $mail->data($mime->as_string);
  $mail->quit;
}

