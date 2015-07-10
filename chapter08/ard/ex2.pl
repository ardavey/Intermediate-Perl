#!/usr/bin/perl
use strict;
use warnings;

use IO::Handle;

my %filehandles;

while ( my $line = <> ) {
  my ( $name ) = $line =~ m/^(.*):/;
  next if ( !$name );

  $name =~ s/\W//g;
  $name = lc( $name );
  
  if ( ! $filehandles{$name} ) {
    my $fh = IO::File->new( "$name.info", '>' ) or die "Failed to create filehandle: $!";
    $filehandles{$name} = $fh;
  }
  
  print { $filehandles{$name} } $line;
}
