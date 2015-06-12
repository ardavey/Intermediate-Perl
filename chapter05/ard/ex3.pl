#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

my %data = ();

while ( my $line = <> ) {
  next if ( $line =~ m/^\s*#/ );
  my ( $source, $dest, $bytes ) = split( /\s+/, $line );
  $data{$source}{$dest} += $bytes;
}

# We need a list of source hosts, sorted by hostname
foreach my $source ( sort keys %data ) {
  say "$source";

  # And now a list of destination hosts sorted by hostname 
  foreach my $dest ( sort keys %{ $data{$source} } ) {
    # The tabs are just for Alex - he loves them!
    printf( "\t%s\t%u\n", $dest, $data{$source}{$dest} );
  }
}
