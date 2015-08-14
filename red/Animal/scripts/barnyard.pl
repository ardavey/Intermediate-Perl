#!/usr/bin/perl

use v5.14;
use strict;
use warnings;

use Cow;
use Horse;
use Sheep;
use Mouse;

our @ANIMALS = qw( Cow Horse Sheep Mouse );

print "Enter animal names to gain a deep understanding of how they communicate.\n";

my @choice;
while ( <STDIN> ) {
  chomp and my $animal = $_;

  if ( $animal ~~ @ANIMALS ) {
    push @choice, $animal;
    next;
  }

  print STDERR "Sorry, we don't have a $animal\n";
}

foreach my $animal ( @choice ) {
  $animal->speak;
}
