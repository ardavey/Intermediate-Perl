#!/usr/bin/perl
use strict;
use warnings;

# Write a program that takes a list of filenames on the command line and uses
# grep to select the ones whose size is less than 1,000 bytes. Use map to
# transform the strings in this list, putting four space characters in front of
# each and a newline character after. Print the resulting list.

my @files = @ARGV;
my @files_under_1k = grep { -f $_ && ( stat($_) )[7] < 1000 } @files;
my @print_list = map { "    $_\n" } @files_under_1k;

print @print_list;
