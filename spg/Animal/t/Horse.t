use strict;
use warnings;

use Test::More tests => 6;
use Test::Output;

BEGIN {
  use_ok( 'Horse' ) || print "Bail out!\n";
}

diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );

# they have to be defined in Horse.pm
ok( defined &Horse::get_voice, 'Horse::get_voice is defined' );
ok( defined &Horse::get_type, 'Horse::get_voice is defined' );

{
# check that get_voice() returns the expected value
is( Horse->get_voice(), "neigh", 'get_voice() returns correct value' );
}

{
# check that get_type() returns the expected value
is( Horse->get_type(), "Horse", 'get_type() returns correct value' );
}

{
# check that speak() combines these two
stdout_is( sub { Horse->speak }, "Horse says \"neigh\"!\n", 'speak() returns correct value' );
}
