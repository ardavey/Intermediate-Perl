#!/usr/bin/perl

use strict;
use warnings;

my @words = map { chomp; $_ } <>;

print map "$_\n",
  map $_->[0],
  sort { $a->[1] cmp $b->[1] }
  map [ $_, lc tr/A-Za-z//cdr ], @words;
