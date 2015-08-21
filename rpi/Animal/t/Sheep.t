use strict;
use warnings;

use Test::More;

BEGIN{
  use_ok( 'Sheep' ) || print "Bail out!\n";
  require_ok( 'Sheep' ) || print "Bail out!\n";
}

diag( "Testing Sheep $Animal::VERSION, Perl $], $^X" );

{
# check that sound() returns correctly
is( Sheep->sound(), 'baaaah', 'sound() returns baaaah' );
}

done_testing();
