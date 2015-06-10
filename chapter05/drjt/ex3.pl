#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

# This is literally the same code, only with default sorts, and a different format for the output. 40 minutes my arse.
my %total_bytes;
while ( <> ) {
  my ( $source, $dest, $bytes ) = split;
  $total_bytes{$source}{$dest} += $bytes;
  $total_bytes{$source}{total} += $bytes;
}

foreach my $source ( sort keys %total_bytes ) {
  delete $total_bytes{$source}{total};
  say $source;
  foreach my $dest ( sort keys %{ $total_bytes{$source} } ) {
    printf "  %s %s\n", $dest, $total_bytes{$source}{$dest};
  }
}
