#!/usr/bin/perl

use strict;
use warnings;
use DateTime;
use Date::Oogaboogoo qw(:all);

my $dt = now DateTime;

printf "Today is %s %s %02d %04d\n",
  number_to_day_name( $dt->day_of_week - 1 ),
  number_to_month_name( $dt->month - 1 ),
  $dt->day,
  $dt->year;
