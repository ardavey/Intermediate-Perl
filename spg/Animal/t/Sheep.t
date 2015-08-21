use strict;
use warnings;

use Test::More tests => 6;
use Test::Output;

BEGIN {
  use_ok( 'Sheep' ) || print "Bail out!\n";
}

diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# they have to be defined in Sheep.pm
ok( defined &Sheep::get_voice, 'Sheep::get_voice is defined' );
ok( defined &Sheep::get_type, 'Sheep::get_voice is defined' );

{
# check that get_voice() returns the expected value
is( Sheep->get_voice(), "baaaaa", 'get_voice() returns correct value' );
}

{
# check that get_type() returns the expected value
is( Sheep->get_type(), "Sheep", 'get_type() returns correct value' );
}

{
# check that speak() combines these two
stdout_is( sub { Sheep->speak }, "Sheep says \"baaaaa\"!\n", 'speak() returns correct value' );
}
