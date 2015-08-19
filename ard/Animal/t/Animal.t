use strict;
use warnings;

use Test::More tests => 6;

BEGIN {
  use_ok( 'Animal' ) || BAIL_OUT();
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

ok( defined &Animal::speak, 'Animal::speak is defined' );
ok( defined &Animal::sound, 'Animal::sound is defined' );

{
  # check that sound() dies
  eval { Animal->sound() } or my $at = $@;
  like( $at, qr/must override/, 'sound() dies with a message' );
}

{
  # check that speak() dies
  eval { Animal->speak() } or my $at = $@;
  like( $at, qr/must override/, 'speak() dies with a message' );
}

{
  package Foofle;
  use parent qw( Animal );
  sub sound { 'foof' }
}

ok( Foofle->speak, 'An Animal subclass does the right thing' ); 
