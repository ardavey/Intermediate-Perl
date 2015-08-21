#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 5;

BEGIN {
  use_ok( 'Sheep' ) || print "Bail out!\n";
}

diag( "Testing Sheep $Sheep::VERSION, Perl $], $ ^ X" );

# This is defined in Animal
ok( !defined &Sheep::speak, "Sheep speak shouldn't be defined" );
ok( defined &Sheep::sound, 'Sheep sound is defined' );

# speak returns true, output goes to the screen
like( Sheep->sound(), qr/^baa/, 'Sheep makes the right noise' );
ok( Sheep->speak(), 'Sheep can speak' );
