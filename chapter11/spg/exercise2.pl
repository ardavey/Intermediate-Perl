#! /usr/bin/perl

use strict;
use warnings;
use Stereotypes qw( :all );

my ( $sec, $min, $hour, $mday, $mon, $year, $wday ) = localtime;

printf "Today is %s %s %s %s\n", dow_to_name( $wday ), moy_to_name( $mon ), $mday, $year += 1900;

# Test broken dates

$mon = 20;
$wday = 102;

printf "Today is %s %s %s %s\n", dow_to_name( $wday ), moy_to_name( $mon ), $mday, $year += 1900;
