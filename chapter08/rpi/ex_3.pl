#!/usr/bin/perl

use strict;
use warnings;

use IO::File;

use v5.10;

foreach my $dir ( @ARGV ) {
  opendir my $dir_handle, $dir or die "Opening dir failed: $!\n";
  read_dir_contents( $dir_handle, $dir );
}

sub read_dir_contents {
  my ( $dir_handle, $dir_name ) = @_;

  print "Files in $dir_name are:\n";

  foreach my $file ( readdir( $dir_handle ) ) {
    print "$file\n"
  }
}
