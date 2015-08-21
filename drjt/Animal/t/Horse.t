use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
  use_ok( 'Horse' ) || print "Bail out!\n";
}

diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# they have to be defined in Horse.pm
ok( defined &Horse::sound, 'Horse::sound is defined' );

is( Horse->sound(), 'neigh', 'sound() is correct' );
