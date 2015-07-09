#!/usr/bin/perl

use strict;
use warnings;

my $file_handles = {};

open my $input_file, '<', 'datafile.txt' or die "Could not open datafile.txt: $!";

while ( <$input_file> ) {
  my $line = readline $input_file;

  next if ( !defined $line || $line !~ /^([^:]+):/ );

  my ( $name, undef ) = split ( ':', $line );
 
  $name = lc ( $name );
  
  if ( !defined $file_handles->{$name} ) {
    open my $fh, '>', "$name.info" or die "Cannot create $name.info: $!";
    $file_handles->{$name} = $fh;
  }

  print { $file_handles->{$name} } $line;
}


