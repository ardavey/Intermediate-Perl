#!/usr/bin/perl
use warnings;
use strict;
use Storable qw( nstore retrieve );

my $db = '.coconet.db';
my %stats;
%stats = %{ retrieve $db } if -f $db;

my $fn = shift @ARGV // 'coconet.dat';
open my $fh, '<', $fn;

while( <$fh> ) {
  next if /^\s*(#.*)?$/;
  my ( $src, $dest, $bytes ) = split;
  $stats{$src}{$dest} += $bytes;
}

close $fh;

nstore \%stats, $db;

for my $src ( sort keys %stats ) {
  print $src, "\n";

  for my $dest ( sort keys %{ $stats{$src} } ) {
    print "  $dest $stats{$src}{$dest}\n";
  }
}

