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

foreach my $source ( sort keys %total_bytes ) {
  my %dest_bytes = %{$total_bytes{$source}};
  delete $dest_bytes{total};
  say $source;
  foreach my $dest ( sort keys %dest_bytes ) {
    printf "  %s %s\n", $dest, $dest_bytes{$dest};
  }
}
