use strict;
use warnings;
use My::List::Util qw( sum shuffle ); 

use Test::More tests => 8;

BEGIN {
  require_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X" );

ok( defined &sum, 'My::List::Util::sum is defined' );

my @test_input_numbers = ( 1, 3, 6, 9, 23 ); 
is( sum( @test_input_numbers ), 42, "The sum method behaves as expected for a list of numbers" );

my @test_input_words = qw( ab cde fgh ijk wxy ); 
is( sum( @test_input_words ), 0, "The sum method behaves as expected for a list of words" );

my @test_input_mix = qw( ab 3 fgh 9 wxy ); 
is( sum( @test_input_mix ), 12, "The sum method behaves as expected for a list of words and numbers" );

ok( defined &shuffle, 'My::List::Util::shuffle is defined' );

my @test_input_shuffle = qw( ab 3 fgh 9 wxy );
my $test_output_shuffle = shuffle( @test_input_shuffle );
is( scalar @$test_output_shuffle, scalar @test_input_shuffle, "List is same size" );

is( shuffle(), undef, "Empty list returns undef" )
