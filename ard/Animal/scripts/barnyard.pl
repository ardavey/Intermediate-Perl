#!/usr/bin/perl
use strict;
use warnings;

use lib '../lib';

use Cow;
use Horse;
use Sheep;
use Mouse;

my @barnyard = ();

print "Give me some animal names - empty to finish:";
while ( chomp( my $input = <STDIN> ) ) {
  last if $input eq '';
  push @barnyard, ucfirst $input;
}

foreach my $animal ( @barnyard ) {
  eval {
    $animal->speak;
  };
  if ( $@ ) {
    print "I don't think I've heard of a '$animal'!\n"
  }
}
