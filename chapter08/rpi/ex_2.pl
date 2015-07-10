#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

use v5.10;

my $input = IO::File->new( 'log_file', 'r' ) or die "Can't open log file: $!\n";

while ( <$input> ) {
  state $fhs;

  chomp;
  my ( $file_name, $contents ) = split ':';

  unless( $fhs->{ $file_name } ) {
    my $fh = IO::File->new( $file_name, 'w' ) or die "Can't open file $file_name: $!\n";
    $fhs->{ $file_name } = $fh;
  }

  print { $fhs->{ $file_name } } "$contents\n";
}
