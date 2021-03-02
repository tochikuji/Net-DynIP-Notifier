use common::sense;
use Carp qw/croak/;
use Term::ReadKey;
use Crypt::Lite;


ReadMode 'noecho';
say "Enter SMTP password:";
chomp(my $server_pass = ReadLine 0 );

say "Enter again:";
chomp(my $server_pass_ = ReadLine 0 );

if ($server_pass ne $server_pass_) {
  croak "Input password mismatched!";
}

say "Enter encryption password:";
chomp(my $encrypt_pass = ReadLine 0 );

say "Enter again:";
chomp(my $encrypt_pass_ = ReadLine 0 );

if ($encrypt_pass ne $encrypt_pass_) {
  croak "Input password mismatched!";
}

my $crypt = Crypt::Lite->new(debug => 0);
my $encrypted = $crypt->encrypt($server_pass, $encrypt_pass);

say "Crypted server pass is:";
say $encrypted;
say "Paste it into config file.";

my $dep = $crypt->decrypt($encrypted, $encrypt_pass);
say $dep;
