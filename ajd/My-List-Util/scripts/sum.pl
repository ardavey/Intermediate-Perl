#!/usr/bin/perl

use strict;
use warnings;

use My::List::Util 'sum';
use Data::Dumper;

my $sum = sum( 1..10 );
print Dumper( $sum );


