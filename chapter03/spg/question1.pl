#!/usr/bin/perl

use strict;
use warnings;

print map { " " x4, $_, "\n" } grep { -s$_ < 1000 } @ARGV;