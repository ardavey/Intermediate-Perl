#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'MyDate' ) || print "Bail out!\n";
}

diag( "Testing MyDate $MyDate::VERSION, Perl $], $^X" );
