#!/usr/bin/perl

use strict;
use warnings;

# Take some files on the command line, return the ones that are
# < 1000 bytes. Print with four spaces before and a newline after.

print "These files are < 1000B:\n", map { "    $_\n" } grep { -s $_ < 1000 } @ARGV;

