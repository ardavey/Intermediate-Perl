#!/usr/bin/perl

use strict;
use warnings;

my $hardcoded = "../chapter2/";

chomp ( my $input = <STDIN> );

while ( $input ne '' ) {

  eval { print map { " " x4, $_, "\n" } grep { $_ =~ /$input/i  } glob ( "$hardcoded/*" ) };
 
  if ( $@ ) {
    print "Invalid regex!\n"
  } 

  chomp ( $input = <STDIN> );

}