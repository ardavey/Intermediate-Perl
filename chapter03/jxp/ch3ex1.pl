#!/usr/bin/perl

use strict;
use warnings;


my @results = grep { -s $_ < 1000 } @ARGV;

@results = map ' ' x4 . $_ . "\n", @results;

print ( @results );
  