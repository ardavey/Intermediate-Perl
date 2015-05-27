#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

print map { "    $_\n" } grep { 1000 > -s } @ARGV ;
