#!/usr/bin/perl

use strict;
use warnings;

use IslandDate qw( :all );

my ( $mday, $mon, $year, $wday ) = ( localtime )[ 3 .. 6 ];

$wday = number_to_day_name( $wday );
$mon = number_to_month_name( $mon );
$year += 1900;

print "Today is $wday $mon $mday $year\n";

