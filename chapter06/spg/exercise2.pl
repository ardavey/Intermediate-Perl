#!/usr/bin/perl

use strict;
use warnings;
use JSON;

my $output = "stored_data.json";

my $data = {};

if ( -s $output ) {
  open( my $input_file, '<', $output ) or die "could not create file '$output' $!";
  ;
  my $json_string;
  while ( <$input_file> ) {
    $json_string .= $_;
  }
  close $input_file;
  $data = from_json( $json_string );
}

while ( <> ) {
  my ( $source, $dest, $transfer ) = split;
  $data->{$source}->{$dest} += $transfer;
}

open( my $output_file, '>', $output ) or die "could not create file '$output' $!";

print $output_file to_json( $data );

close $output_file;
