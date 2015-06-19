#!/usr/bin/perl

use strict;
use warnings;
use Storable qw( retrieve nstore );

my $output = "stored_data.dat";

my $data = {};

if ( -s $output ) {
  $data = retrieve( $output );
}

while ( <> ) {
  my ( $source, $dest, $transfer ) = split;
  $data->{$source}->{$dest} += $transfer;
}

nstore( $data, $output );
