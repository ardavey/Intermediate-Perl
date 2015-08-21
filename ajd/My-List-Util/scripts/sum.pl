#!/usr/bin/perl

use strict;
use warnings;

use My::List::Util;
use Data::Dumper;

my $sum = My::List::Util->sum( 1..10 );
print Dumper( $sum );


