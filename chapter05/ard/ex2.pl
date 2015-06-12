#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

my %data = ();

# Bit of a hack - I'm using this as a fake "destination" host to count total traffic
# from each source. Contains asterisks and spaces so it shouldn't ever clash with a real host name.
my $any_dest = '* ANYWHERE *';

while ( my $line = <> ) {
  next if ( $line =~ m/^\s*#/ );
  my ( $source, $dest, $bytes ) = split( /\s+/, $line );
  $data{$source}{$dest} += $bytes;
  $data{$source}{$any_dest} += $bytes;
}

# We need a list of source hosts, sorted by descending order of number of bytes sent to any host
foreach my $source ( sort { $data{$b}{$any_dest} <=> $data{$a}{$any_dest} } keys %data ) {
  say "\n$source sent a total of $data{$source}{$any_dest} bytes:";

  # And now a list of destination hosts sorted by descending order of number of bytes sent
  foreach my $dest ( sort { $data{$source}{$b} <=> $data{$source}{$a} } keys %{ $data{$source} } ) {
    next if ( $dest eq $any_dest );
    printf( "\t%s => %s: %u\n", $source, $dest, $data{$source}{$dest} );
  }
}
