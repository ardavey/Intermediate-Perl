use strict;
use warnings;

use Test::More tests => 8;
use Test::Output;

BEGIN {
  use_ok( 'Animal' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# they have to be defined in Animal.pm
ok( defined &Animal::speak, 'Animal::speak is defined' );
ok( defined &Animal::get_voice, 'Animal::get_voice is defined' );
ok( defined &Animal::get_type, 'Animal::get_voice is defined' );

{
# check that get_voice() returns the expected value
is( Animal->get_voice(), "welcome to the jungle", 'get_voice() returns correct value' );
}

{
# check that get_type() returns the expected value
is( Animal->get_type(), "Unknown beast, shrouded in darkness,", 'get_type() returns correct value' );
}

{
# check that speak() combines these two
stdout_is( sub { Animal->speak }, "Unknown beast, shrouded in darkness, says \"welcome to the jungle\"!\n", 'speak() returns correct value' );
}

{
  package Foofle;
  use parent qw(Animal);
  use Test::Output;
  sub get_voice { 'foof' };
  sub get_type { 'Foofle' };

  stdout_is(
    sub { Foofle->speak() },
    "Foofle says \"foof\"!\n",
    'An Animal subclass does the right thing'
  );
}
