use strict;
use warnings;

use Test::More;

BEGIN{
  use_ok( 'Cow' ) || print "Bail out!\n";
  require_ok( 'Cow' ) || print "Bail out!\n";
}

diag( "Testing Cow $Animal::VERSION, Perl $], $^X" );

{
# check that sound() returns correctly
is( Cow->sound(), 'moooo', 'sound() returns moooo' );
}

done_testing();
