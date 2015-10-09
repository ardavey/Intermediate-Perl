#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

use Acme::ADEAS::Utils qw( sum );

plan tests => 8;

diag( "Testing Acme::ADEAS::Utils $Acme::ADEAS::Utils::VERSION, Perl $], $^X" );

is( sum( 1 ), 1, "Sum of only 1" );
is( sum( 1..10 ), 55, "Sum of 1 - 10 is 55" );
is( sum( 1, -1 ), 0, "Sum of 1 and -1 is 0" );
is( sum( ), 0, "Sum of no numbers is 0" );

# For everything that isn't numbers, the result will be 0
# Unless I change my mind
is( sum( qw( a b c ) ), 0, "Sum of some letters is 0" );
is( sum( [ qw( 1 2 3 ) ] ), 0, "Arrayref sum 0" );
is( sum( { a => 1 } ), 0, "Hashref sum 0" );
is( sum( sub { 1 } ), 0, "Coderef sum 0" );

