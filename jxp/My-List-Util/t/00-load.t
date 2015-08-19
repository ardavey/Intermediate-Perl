#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 1;

BEGIN {
    use_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing MyListUtil $My::List::Util::VERSION, Perl $], $^X" );