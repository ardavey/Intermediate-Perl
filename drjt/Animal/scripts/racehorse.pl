#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use Racehorse;
for (1..5) {
  my $horse = Racehorse->new( 'Billy Boy' );
  $horse->won;
  say $horse->get_name . ' has standings ' . $horse->standings;
}
