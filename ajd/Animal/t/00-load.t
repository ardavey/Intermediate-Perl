#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 7;

BEGIN {

  foreach my $module ( qw( Animal Cow Horse Sheep Mouse Person LivingCreature ) ) {
    use_ok( $module ) || print "Bail out!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
