#!/usr/bin/perl
use strict;
use warnings;
use Storable;

# Mostly taken from ch5 ex3 solution in the book

my %total_bytes;
while (<>) {
  next if /\A\s*#/;  # skip comment lines
  my ($source, $destination, $bytes) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

#Untested, should probably also read in existing total first.
my $filename = "running_totals.dat";
open ( my $fh, ">", $filename );
foreach my $source ( sort keys %total_bytes ) {
  print "$source\n";
  my $dest_hash = $total_bytes{$source};
  foreach my $dest ( sort keys %$dest_hash ) {
    my $running_total = freeze [ $dest, $dest_hash−>{$dest} ];
	print $fh $running_total;
  }
}
close $fh;