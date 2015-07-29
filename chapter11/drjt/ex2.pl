#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use Time::Piece;

require ex1;

my $time = Time::Piece->new();

my $day = ex1::number_to_day_name( $time->day_of_week() );
my $day_of_month = $time->day_of_month();
my $month = ex1::number_to_month_name( $time->mon() );
my $year = $time->year();

say "Today is $day $day_of_month $month $year";
