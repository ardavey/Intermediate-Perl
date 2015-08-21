#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 5;

BEGIN {
  use_ok( 'Cow' ) || print "Bail out!\n";
}

diag( "Testing Cow $Cow::VERSION, Perl $], $ ^ X" );

# This is defined in Animal
ok( !defined &Cow::speak, "Cow speak shouldn't be defined" );
ok( defined &Cow::sound, 'Cow sound is defined' );

# speak returns true, output goes to the screen
like( Cow->sound(), qr/^moo/, 'Cow makes the right noise' );
ok( Cow->speak(), 'Cow can speak' );
