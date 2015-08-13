#!/usr/bin/perl

use strict;
use warnings;

use Animal;
use Cow;
use Horse;
use Sheep;
use Mouse;

print "Build your own farm!\n";

my @barnyard

while ( my $input = <STDIN> ) {
  chomp( $input ); 
  push @barnyard, $input;
}

foreach my $animal ( @barnyard ) {
  eval { $animal->speak(); };

  if ( $@ ) {
    print "$animal is not an animal we are allowed on this farm...\n";
  } 
}
