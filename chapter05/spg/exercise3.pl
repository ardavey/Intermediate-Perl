#!/usr/bin/perl

use strict;
use warnings;

# There are no comments!
my $data = {};
my $sources = {};
my $output = "coconet_sorted.dat";

while ( <> ) {
  my ( $source, $dest, $transfer ) = split;
  $data->{$source}->{$dest} += $transfer;
  $sources->{$source} += $transfer;
}

open( my $file, '>', $output ) or die "could not create file '$output' $!";

foreach my $source ( sort { $a cmp $b } keys $sources ) {

  print $file sprintf( "%s\n", $source );

  foreach my $dest ( sort { $a cmp $b } keys $data->{$source} ) {

    print $file sprintf( "\t%s %s\n", $dest, $data->{$source}->{$dest} );

  }
}

close $file;
