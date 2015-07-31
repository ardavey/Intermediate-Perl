#!/usr/bin/perl

use strict;
use warnings;

use Time::Piece;
use Oogaboogoo::Time;

my ( $get_day, $get_month ) = Oogaboogoo::Time::get_converters();

my $now = localtime;

my $day = $get_day->( $now->fullday );
my $month = $get_month->( $now->fullmonth );

print "Today is $day $month\n$now\n";
