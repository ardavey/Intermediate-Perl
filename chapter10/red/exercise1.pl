#!/usr/bin/perl

use strict;
use warnings;

chdir;

my @sorted =
  map $_->[0],
  sort { $a->[1] <=> $b->[1] }
  map [ $_, -s ], glob '*';

print map "$_\n", @sorted;
