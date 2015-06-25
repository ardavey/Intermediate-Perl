#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

# Rewrite this so it doesn't annoy the monkey:
chdir;
my @sorted = sort { -s $a <=> -s $b } glob '*';
print Dumper( \@sorted );

my @schwartz = map { $_->{name} }
             sort { $a->{size} <=> $b->{size} }
             map { { name => $_, size => -s $_ } }
             glob '*';
print Dumper( \@schwartz );

