#!/usr/bin/perl

use strict;
use warnings;
use Date::Oogaboogoo qw( number_to_day_name number_to_month_name );

printf "The Oogaboogoo days are: %s\n", join ' ', map number_to_day_name( $_ ), ( 0 .. 6 );
printf "The Oogaboogoo months are: %s\n", join ' ', map number_to_month_name( $_ ), ( 0 .. 11 );

eval { number_to_day_name( 7 ) };
print $@ if $@;

eval { number_to_month_name( -4 ) };
print $@ if $@;
