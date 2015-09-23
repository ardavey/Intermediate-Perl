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

{
  package Foofle;
  use Moose;
  with qw(Animal);
  use Test::Output;
  sub get_voice { 'foof' };
  sub get_type { 'Foofle' };

  stdout_is(
    sub { Foofle->speak() },
    "Foofle says \"foof\"!\n",
    'An Animal subclass does the right thing'
  );
}
