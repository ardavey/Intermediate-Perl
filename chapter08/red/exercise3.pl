#!/usr/bin/perl

use strict;
use warnings;

my %dirs = map {
  opendir my $dir, $_ or die "Couldn't open $_: $!";
  $_ => $dir
} @ARGV;

while ( my ( $dir, $handle ) = each %dirs ) {
  dir_contents( $dir, $handle );
}

sub dir_contents {
  my ( $dir, $handle ) = @_;

  print $dir, " contains:\n";
  print $_, "\n" for grep $_ !~ /^\.\.?$/, readdir $handle;
}

