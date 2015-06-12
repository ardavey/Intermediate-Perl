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
foreach my $host ( sort { by_host_data( $a, $b, \%total_bytes ) } keys %total_bytes ) {

  foreach my $dest ( sort { by_dest_data( $a, $b, $total_bytes{$host} ) } keys $total_bytes{$host} ) {
    print "$host => $dest: $total_bytes{$host}{$dest}\n";
  }

}

# Sort functions
sub by_host_data {

  my ( $a, $b, $total_bytes ) = @_;
  my ( $a_total, $b_total );
  $a_total += $total_bytes->{$a}{$_} foreach keys $total_bytes->{$a};
  $b_total += $total_bytes->{$b}{$_} foreach keys $total_bytes->{$b};
  $b_total <=> $a_total;

}

sub by_dest_data {

  my ( $a, $b, $dest_bytes ) = @_;
  $dest_bytes->{$b} <=> $dest_bytes->{$a};

}


