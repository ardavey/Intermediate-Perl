use strict;
use warnings;

use Test::More;

BEGIN{
  use_ok( 'Horse' ) || print "Bail out!\n";
  require_ok( 'Horse' ) || print "Bail out!\n";
}

diag( "Testing Horse $Animal::VERSION, Perl $], $^X" );

{
# check that sound() returns correctly
is( Horse->sound(), 'neigh', 'sound() returns neigh' );
}

done_testing();
