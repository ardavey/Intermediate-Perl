#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use Test::More tests => 2;
use Test::My::List::Util;
require My::List::Util;

my $sum = My::List::Util::sum( 2, 2);
sum_ok( $sum, 4, '2+2=4' );
sum_ok( $sum, 5, '2+2=5' );
