use Test::More;
use Test::Exception;

BEGIN {
  use_ok( 'Animal' );
  diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
}

throws_ok {
  package Squid {
    use Moose;
    with qw( Animal );
  }
} qr/'Animal' requires the method 'sound' to be implemented by 'Squid'/,
  'Classes with role Animal fail without sound';

package Walrus {
  use Moose;
  with qw( Animal );
  sub sound { 'Groaargh!' }
}

is ( Walrus->sound, 'Groaargh!', 'Concrete animal types have a sound' );

&done_testing;
