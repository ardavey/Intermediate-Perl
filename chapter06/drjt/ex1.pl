#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use Storable qw( nstore retrieve );

my $storage = 'coconet.archive';

my %total_bytes;
if ( -r $storage ) {
  %total_bytes = %{ retrieve( $storage ) };
}

while ( <> ) {
  my ( $source, $dest, $bytes ) = split;
  $total_bytes{$source}{$dest} += $bytes;
}

foreach my $source ( sort keys %total_bytes ) {
  say $source;
  foreach my $dest ( sort keys %{ $total_bytes{$source} } ) {
    printf "  %s %s\n", $dest, $total_bytes{$source}{$dest};
  }
}

nstore( \%total_bytes, $storage );
