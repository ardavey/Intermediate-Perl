#!/usr/bin/perl
use 5.010;
use warnings;
use strict;


chdir;
my @sorted = map { $_->[0] } sort { $a->[1] <=> $b->[1] } map { [ $_, -s $_ ] } glob '*';

say "@sorted";
