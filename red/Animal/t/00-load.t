#!perl -T
use v5.10.1;
use strict;
use warnings;
use Test::More;

plan tests => 7;

BEGIN {
  foreach my $pkg ( qw( LivingCreature Animal Person Cow Horse Sheep Mouse ) ) {
    use_ok( $pkg ) || print "Bail out!\n";
  }
}
