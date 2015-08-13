#!/usr/bin/perl

use strict;
use warnings;

use My::List::Util;
use Data::Dumper;

my @array = qw( a b c d e f g h i j );

my @shuffled = My::List::Util->shuffle( @array );
print Dumper( \@shuffled );


