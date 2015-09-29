#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Test::More;

BEGIN {
    use_ok('My::List::Util') || print "Bail out!\n";
}

diag("Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X");

ok( defined &My::List::Util::sum,     'My::List::Util::sum is defined' );
ok( defined &My::List::Util::shuffle, 'My::List::Util::shuffle is defined' );

{    # sum tests
    is( My::List::Util::sum( 1, 2, 3 ), 6, 'Check sum calculates correctly' );
    is( My::List::Util::sum(), 0, 'Check sum with empty list' );
}

{    # shuffle tests
    {
        my @arr          = qw( hello world pie gravy blarg honk );
        my @modified_arr = @arr;

        My::List::Util::shuffle( \@modified_arr );

        is( scalar @modified_arr,
            scalar @arr, 'Check shuffle returns a list of the same size' );
    }

    {
        is( My::List::Util::shuffle(), undef, 'Check shuffle with empty list' );
    }
}

done_testing();