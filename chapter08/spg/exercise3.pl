#!/usr/bin/perl

use strict;
use warnings;

if ( !@ARGV ) {
  print "No directories supplied";
}

foreach my $dir_name ( @ARGV ) {

  opendir my $dh, $dir_name or die "Could not open directory: $!";

  print_files( $dh );
}

sub print_files {
  my ( $dh ) = @_;

  foreach my $file  ( readdir( $dh ) ) {
    print "Located $file!\n";
  }
} 


