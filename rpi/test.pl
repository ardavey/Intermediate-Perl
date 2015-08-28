#!/uer/bin/perl

use strict;
use warnings;

use Date;
use Time::Piece;

my $myDate = Date->new();

my $date = $myDate->date();
print "Today is $date\n";

my $month = $myDate->month();
print "The month is $month\n";

my $year = $myDate->year();
print "The year is $year\n";

$myDate->debug( 'Over here!' );

sub UNIVERSAL::debug {
  my $obj = shift;
  my $msg = shift;

  my $time = localtime;

  print $time->datetime, " ", $obj, " ", $msg, "\n";
}
