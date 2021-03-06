#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;
use Test::My::List::Util;

use My::List::Util;

plan tests => 9;

diag( "Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X" );

sum_ok( My::List::Util::sum( 1 ), 1, "Sum of only 1" );
sum_ok( My::List::Util::sum( 1..10 ), 55, "Sum of 1 - 10 is 55" );
sum_ok( My::List::Util::sum( 1, -1 ), 0, "Sum of 1 and -1 is 0" );
sum_ok( My::List::Util::sum( ), 0, "Sum of no numbers is 0" );

# For everything that isn't numbers, the result will be 0
# Unless I change my mind
sum_ok( My::List::Util::sum( qw( a b c ) ), 0, "Sum of some letters is 0" );
sum_ok( My::List::Util::sum( [ qw( 1 2 3 ) ] ), 0, "Arrayref sum 0" );
sum_ok( My::List::Util::sum( { a => 1 } ), 0, "Hashref sum 0" );
sum_ok( My::List::Util::sum( sub { 1 } ), 0, "Coderef sum 0" );

# Let's fail one
sum_ok( My::List::Util::sum( 1 ), 2, "wrongsum" );
