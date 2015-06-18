#!/usr/bin/perl

use strict;
use warnings;

print "Welcome to the chapter 3 file processor\n";

if ( ! scalar @ARGV > 0 ) {
  print "No arguments no fun!\n";
  exit;
}

my @small_files = grep { -e $_ && ( stat( $_ ) )[7] < 1000 } @ARGV;

my @processed_files = map { "    $_\n" } @small_files;

print @processed_files;
