#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use autodie;
use JSON;

my $storage = 'coconet.json';

my %total_bytes;
if ( -r $storage ) {
  open( my $handle, '<:encoding(UTF-8)', $storage );
  my $file;
  $file .= $_ while <$handle>;
  %total_bytes = %{ from_json( $file ) };
  close $handle;
}
elsif ( -e _ ) {
  die "cannot read from $storage\n";
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

open( my $handle, '>:encoding(UTF-8)', $storage );
print $handle to_json( \%total_bytes );
close $handle;
