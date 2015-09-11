#!/usr/bin/perl

use strict;
use warnings;

use My::List::Util 'shuffle';
use Data::Dumper;

my @array = qw( a b c d e f g h i j );

my @shuffled = shuffle( @array );
print Dumper( \@shuffled );


