use strict;
use warnings;

use Test::More;

BEGIN {
  require_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing My::List::Util::sum' $My::List::Util::VERSION, Perl $], $^X" );
ok( defined &My::List::Util::sum, 'My::List::Util::sum is defined' );

is( My::List::Util::sum( 1, 5 ), 6, 'sum correctly adds 2 integers' );
is( My::List::Util::sum( 1, 2, 3 ), 6, 'sum correctly adds 3 integers' );
is( My::List::Util::sum(), undef, 'sum returns undef when no arguments' );
is( My::List::Util::sum( 1, undef, 2 ), 3, 'sum can handle undefs' );
is( My::List::Util::sum( 1, 10**10 ), 10000000001, 'sum can deal with large numbers' );
diag( 'You get the idea' );

done_testing( 7 );
