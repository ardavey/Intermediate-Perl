#!/usr/bin/perl

use strict;
use warnings;

if ( !scalar @ARGV ) {
  die "usage: $0 <some data file>\n";
}

# Get the file read
my %total_bytes;

while ( <> ) {
  if ( /^#/) { next };
  my ( $source, $destination, $bytes ) = split;
  $total_bytes{$source}{$destination} += $bytes;
}

# Sorting and printing
foreach my $host ( sort keys %total_bytes ) {

  print "$host\n";
  foreach my $dest ( sort keys $total_bytes{$host} ) {
    print "\t$dest $total_bytes{$host}{$dest}\n";
  }

}

