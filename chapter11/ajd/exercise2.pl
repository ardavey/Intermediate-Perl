#!/usr/bin/perl

use strict;
use warnings;

use IslandDate;

my ( $mday, $mon, $year, $wday ) = ( localtime )[ 3 .. 6 ];

$wday = IslandDate::number_to_day_name( $wday );
$mon = IslandDate::number_to_month_name( $mon );
$year += 1900;

print "Today is $wday $mon $mday $year\n";

# Since someone already wrote a better module for this...

use Time::Piece;
my $t = Time::Piece->new();
$t->day_list( qw( ark dip wap sen pop sep kir ) );
$t->mon_list( qw( diz pod bod rod sip wax lin sen kun nap dep ) );
print "Today is ", join ( ' ' ,$t->day(), $t->month(), $t->mday(), $t->year() ), "\n";

