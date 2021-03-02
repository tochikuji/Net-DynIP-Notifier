use strict;
use warnings;

use Carp qw/croak/;

use IO::Interface::Simple;

sub get_ipaddr {
  my $iface_name = shift;

  my $interface = IO::Interface::Simple->new($iface_name);

  unless defined $interface {
    croak("Cannot get the interface infomation of '${interface}'");
  }

  my $addr = $interface->address;

  return $addr;
}

1;
