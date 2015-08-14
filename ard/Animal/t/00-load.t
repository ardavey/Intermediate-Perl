#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 7;

BEGIN {
  my @classes = qw(
    Animal
    Cow
    Horse
    Sheep
    Mouse
    Person
    LivingCreature
  );

  foreach my $class ( @classes ) {
    use_ok( $class ) || print "Bail out - $class did not compile!\n";
  }
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
