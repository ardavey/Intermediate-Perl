#!/usr/bin/perl

use strict;
use warnings;

use Time::Piece;
use OogaboogooCalendar qw(:all);

use Data::Dumper;

my $t = localtime;

my $day = number_to_day( $t->_wday);
my $month = number_to_month( $t->_mon);

printf( "Today is %s %u %s %u\n", $day, $t->mday, $month, $t->year );
