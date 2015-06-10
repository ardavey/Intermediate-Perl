#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

# Slurp the file into a hash of hashrefs
my %total_bytes;
while ( <> ) {
  my ( $source, $dest, $bytes ) = split;
  $total_bytes{$source}{$dest} += $bytes;
  $total_bytes{$source}{total} += $bytes;
}

foreach my $source ( sort { $total_bytes{$b}{total} <=> $total_bytes{$a}{total} } keys %total_bytes ) {
  my %dest_bytes = %{$total_bytes{$source}};
  delete $dest_bytes{total};
  foreach my $dest ( sort { $dest_bytes{$b} <=> $dest_bytes{$a} } keys %dest_bytes ) {
    printf "%s => %s: %s\n", $source, $dest, $dest_bytes{$dest};
  }
}
