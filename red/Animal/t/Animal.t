use Test::More;
use Test::Exception;

BEGIN {
  use_ok( 'Animal' );
  diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
}

throws_ok { Animal->sound } qr/Animal::sound has not been implemented/,
  "Abstract animals can't make a sound";

throws_ok { Animal->speak } qr/Animal::sound has not been implemented/,
  "Abstract animals can't speak";

package Walrus {
  use parent qw( Animal );
  sub sound { 'Groaargh!' }
}

is ( Walrus->sound, 'Groaargh!', 'Concrete animal types have a sound' );

&done_testing;
