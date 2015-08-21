use strict;
use warnings;

use Test::More tests => 6;

BEGIN {
  use_ok( 'Animal' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# they have to be defined in Animal.pm
ok( defined &Animal::speak, 'Animal::speak is defined' );
ok( defined &Animal::sound, 'Animal::sound is defined' );

{

  # check that sound() dies
  eval { Animal->sound() } or my $at = $@;
  like( $at, qr/overridden/, 'sound() dies with a message' );
}

{

  # check that speak() dies too
  eval { Animal->speak() } or my $at = $@;
  like( $at, qr/overridden/, 'speak() dies with a message' );
}

{

  package Foofle;
  use parent qw(Animal);
  sub sound { 'foof' }
}

is( Foofle->speak(), "A Foofle goes foof!", 'An Animal subclass does the right thing' );
