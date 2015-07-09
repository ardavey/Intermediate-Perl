#!/usr/bin/perl
use strict;
use warnings;
use File::Spec::Functions qw(canonpath);

sub printdir {
  my ( $dirname ) = @_;
  opendir my $dir_fh, $dirname or die "Cannot open directory";
  foreach my $file ( readdir( $dir_fh ) ) {
     print canonpath($dirname),"/",$file, "\n";
  }
}

foreach my $dirname ( @ARGV ) {
  printdir( $dirname );
}