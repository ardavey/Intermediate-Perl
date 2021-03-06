#!/usr/bin/perl

use 5.010;
use warnings;
use strict;
use autodie;

my %fh;

while ( <> ) {
  my ( $name, $data ) = /^(.*):(.*)$/;
  next if ! $name;
  $name = lc $name;
  if ( !defined $fh{$name} ) {
    open $fh{$name}, '>>', "$name.info";
  }
  say {$fh{$name}} $data;
}
