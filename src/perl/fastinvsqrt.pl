use strict;
use warnings;
use feature qw(say);

while (<>) {
  say fastInvSqrt($_);
}

sub fastInvSqrt {
  my ($x) = @_;
  my $i = unpack("l", pack("f", $x));
  $i = 0x5f3759df - ($i >> 1);
  my $y = unpack("f", pack("l", $i));
  $y * (1.5 - 0.5 * $x * $y * $y);
}
