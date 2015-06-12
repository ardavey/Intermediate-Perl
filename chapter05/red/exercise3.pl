#!/usr/bin/perl

use warnings;
use strict;

my $fn = shift @ARGV // 'coconet.dat';
open my $fh, '<', $fn;

my %stats;
while( <$fh> ) {
  next if /^\s*(#.*)?$/;
  my ( $src, $dest, $bytes ) = split;
  $stats{$src}{$dest} += $bytes;
}

close $fh;

for my $src ( sort keys %stats ) {
  print $src, "\n";

  for my $dest ( sort keys %{ $stats{$src} } ) {
    print "  $dest $stats{$src}{$dest}\n";
  }
}
