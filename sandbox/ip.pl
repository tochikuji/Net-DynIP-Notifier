use common::sense;
use IO::Interface::Simple;
use IO::Handle;
use DDP;

my $a = IO::Interface::Simple->new('enp2s0');
p $a->address;
