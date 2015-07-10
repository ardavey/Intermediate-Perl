use strict;
use warnings;
use IO::Tee;

my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;

my($filename, $scalar)=@ARGV;

my @days = ( "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" );

my $dayofweek = $days[$dow];

open my $fh, ">>", $filename;

my $multi_fh;

my $string;

if ( defined $scalar ){
  open my $scalar_fh, ">>", \ $string;
  $multi_fh = IO::Tee->new( $fh, $scalar_fh );
}
else {
  $multi_fh = IO::Tee->new( $fh );
}
print $multi_fh "Today is ", $dayofweek , " ", $day, "/", $mon+1, "/", $yr+1900, "\n";

if ( defined $string ){
  print $string; # Just for testing
}