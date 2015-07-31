#!/usr/bin/perl
use strict;
use warnings;
use v5.14;
use Time::Piece;

require Ch11ex1;

my $t = localtime;

say "Today is ", $t->fullday, " ", $t->day_of_month," ",$t->fullmonth," ",$t->year; 
say "According to the Oogaboogoo it is ", Ch11ex1::number_to_day_name($t->_wday)," ",$t->day_of_month," ", Ch11ex1::number_to_month_name($t->_mon)," ",$t->year;

