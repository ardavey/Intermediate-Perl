#!/usr/bin/perl

use strict;
use warnings;

# take multiple directories
# display the contents using a function

if ( !@ARGV ) {
  die "Usage: $0 <a bunch of directories>\n";
}

foreach my $dir ( @ARGV ) {
  if ( -d $dir ) {
    opendir ( my $handle, $dir ) || die "Couldn't open '$dir': $!\n";
    print "Contents of : $dir\n";
    print_directory_contents( $handle );
    closedir ( $handle );
  }
}

sub print_directory_contents {

  my ( $handle ) = @_;

  foreach my $file ( grep !/^\./, readdir ( $handle ) ) {
    print "$file\n";
  }
}

