#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 5;

BEGIN {
  use_ok( 'Horse' ) || print "Bail out!\n";
}

diag( "Testing Horse $Horse::VERSION, Perl $], $ ^ X" );

# This is defined in Animal
ok( !defined &Horse::speak, "Horse speak shouldn't be defined" );
ok( defined &Horse::sound, 'Horse sound is defined' );

# speak returns true, output goes to the screen
like( Horse->sound(), qr/^neigh/, 'Horse makes the right noise' );
ok( Horse->speak(), 'Horse can speak' );
