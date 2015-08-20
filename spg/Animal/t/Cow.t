use strict;
use warnings;

use Test::More tests => 6;
use Test::Output;

BEGIN {
  use_ok( 'Cow' ) || print "Bail out!\n";
}

diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# they have to be defined in Cow.pm
ok( defined &Cow::get_voice, 'Cow::get_voice is defined' );
ok( defined &Cow::get_type, 'Cow::get_voice is defined' );

{
# check that get_voice() returns the expected value
is( Cow->get_voice(), "mooooooo", 'get_voice() returns correct value' );
}

{
# check that get_type() returns the expected value
is( Cow->get_type(), "Cow", 'get_type() returns correct value' );
}

{
# check that speak() combines these two
stdout_is( sub { Cow->speak }, "Cow says \"mooooooo\"!\n", 'speak() returns correct value' );
}
