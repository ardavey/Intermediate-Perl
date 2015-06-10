#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

my %data = ();

# Bit of a hack - I'm using this as a fake "destination" host to count total traffic
# from each source. Contains asterisks so it shouldn't clash with a real host name.
my $any_dest = "*ANYWHERE*";

while ( my $line = <> ) {
  next if ( $line =~ m/^\s*#/ );
  my ( $source, $dest, $bytes ) = split( /\s+/, $line );
  $data{$source}{$dest} += $bytes;
  $data{$source}{$any_dest} += $bytes;
}

# We need a list of source hosts, sorted by hostname
foreach my $source ( sort keys %data ) {
  say "$source";

  # And now a list of destination hosts sorted by hostname 
  foreach my $dest ( sort keys %{ $data{$source} } ) {
    next if ( $dest eq $any_dest );
    # The tabs are just for Alex - he loves them!
    printf( "\t%s\t%u\n", $dest, $data{$source}{$dest} );
  }
}
