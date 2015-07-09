#!/usr/bin/perl

use strict;
use warnings;

my %handles;
while (<>) {
  my ( $castaway ) = split /:/;

  if ( !defined $handles{$castaway} ) {
    open $handles{$castaway}, '>', lc $castaway . '.log'
      or die "Failed to write log file for $castaway: $!";
  }

  print { $handles{$castaway} } $_;
}
