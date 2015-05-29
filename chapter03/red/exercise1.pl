#!/usr/bin/perl

use strict;
use warnings;

print map { sprintf "%-4s%s\n", '', $_ } grep -s $_ < 1000, @ARGV;

