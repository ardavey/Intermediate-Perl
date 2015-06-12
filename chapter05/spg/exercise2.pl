#!/usr/bin/perl

use strict;
use warnings;

# There are no comments!
my $data = {};
my $sources = {};

while ( <> ) {
  my ( $source, $dest, $transfer ) = split;
  $data->{$source}->{$dest} += $transfer;
  $sources->{$source} += $transfer;
}

foreach my $source ( sort { $sources->{$b} <=> $sources->{$a} } keys $sources ) {

  print sprintf( "Total for %-50s: %-10s\n", $source, $sources->{$source} );

  foreach my $dest ( sort { $data->{$source}->{$b} <=> $data->{$source}->{$a} } keys $data->{$source} ) {

    print sprintf( "%-28s => %-28s: %-10s\n", $source, $dest, $data->{$source}->{$dest} );

  }
}

