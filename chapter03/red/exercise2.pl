#!/usr/bin/perl

use strict;
use warnings;

my $dir = '/etc';
my @files = glob "$dir/* $dir/.*";

print "Enter patterns for `$dir':\n";

while ( chomp( my $patt = <STDIN> ) ) {
  last if !length $patt;
  eval { print map { sprintf "%-4s%s\n", '', $_ } grep /$patt/, @files };
  print STDERR "Invalid regular expression: $patt\n" if $@;
}

