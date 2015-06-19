#!/usr/bin/perl

use strict;
use warnings;
use autodie;

use 5.010;

use File::Slurp;
use JSON;

my %data = ();
my $datafile = "ex2.json";

if ( -e -f $datafile ) {
  my $json = read_file( $datafile );
  %data = %{ from_json( $json ) };
}

while ( my $line = <> ) {
  next if ( $line =~ m/^\s*#/ );
  my ( $source, $dest, $bytes ) = split( /\s+/, $line );
  $data{$source}{$dest} += $bytes;
}

write_file( $datafile, to_json( \%data ) );

# We need a list of source hosts, sorted by hostname
foreach my $source ( sort keys %data ) {
  say "$source";

  # And now a list of destination hosts sorted by hostname 
  foreach my $dest ( sort keys %{ $data{$source} } ) {
    # The tabs are just for Alex - he loves them!
    printf( "\t%s\t%u\n", $dest, $data{$source}{$dest} );
  }
}
