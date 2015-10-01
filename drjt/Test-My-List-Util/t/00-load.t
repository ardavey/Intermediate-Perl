#!perl -T
use 5.010;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Test::My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing Test::My::List::Util $Test::My::List::Util::VERSION, Perl $], $^X" );
