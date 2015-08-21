use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
  use_ok( 'Sheep' ) || print "Bail out!\n";
}

diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );

# they have to be defined in Sheep.pm
ok( defined &Sheep::sound, 'Sheep::sound is defined' );

is( Sheep->sound(), 'baaaaah', 'sound() is correct' );
