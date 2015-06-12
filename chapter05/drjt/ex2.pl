#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

# copy-pasted from the chapter (mostly)
my %total_bytes;
while ( <> ) {
  my ( $source, $dest, $bytes ) = split;
  $total_bytes{$source}{$dest} += $bytes;

  # store the total bytes for each source machine, to sort over later
  $total_bytes{$source}{total} += $bytes;
}

# loop over the source machines, sorted by total bytes transfered
foreach my $source ( sort { $total_bytes{$b}{total} <=> $total_bytes{$a}{total} } keys %total_bytes ) {

  # We don't want to include the total in the output, and we don't need it any more, so remove that from the current source machine's hash here
  delete $total_bytes{$source}{total};

  # fun fact - this is the only part of this exercise where we needed an
  # explicit dereference! but yeah, sorting over the destination machines,
  # in descending order of bytes transfered
  foreach my $dest ( sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %{ $total_bytes{$source} } )
  {
    printf "%s => %s: %s\n", $source, $dest, $total_bytes{$source}{$dest};
  }
}
