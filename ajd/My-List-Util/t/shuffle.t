#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

use My::List::Util;

plan tests => 6;

diag( "Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X" );

# Shuffle all of the things!
my @array = ( qw( a b c d e ) );

my @shuffled = My::List::Util::shuffle( @array );

is( scalar( @shuffled ), scalar( @array ), "Haven't lost any elements" );

# Make sure everything in @array is in @shuffled
# Can't reliably test the order
foreach my $element( @array ) {
  ok( $element ~~ @shuffled, "Element '" . ($element || '(undef)' ) . "' is there" );
}

# Maybe I could have mocked the random function to get it to shuffle
# in a particular order. That seems like something for the Advanced
# Testing chapter though.

