#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

# Parse the International Standard Book Number from the back of this book
# (9781449393090). Install the Business::ISBN module from CPAN and use it to
# extract the group code and the publisher code from the number.

use Business::ISBN;

my $given_isbn = '9781449393090';

my $isbn = Business::ISBN->new( $given_isbn );

say 'For ISBN ' . $isbn->as_string();
say '  Group code: ' . $isbn->group_code();
say '  Publisher code: ' . $isbn->publisher_code();
