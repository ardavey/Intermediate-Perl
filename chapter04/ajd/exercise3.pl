#!/usr/bin/perl

use strict;
use warnings;

# Smashed all the data into the one structure
my @crew = (
  {
    name     => 'Gilligan',
    hat      => 'White',
    shirt    => 'Red',
    position => 'First Mate',
    location => 'The Island',
  },
  {
    name     => 'Skipper',
    hat      => 'Black',
    shirt    => 'Blue',
    position => 'Captain',
    location => 'The Island',
  },
  {
    name     => 'Mr. Howell',
    hat      => 'Tan?',
    shirt    => 'Olive?',
    position => 'Islander?',
    location => 'The Island Country Club',
  },
  {
    name     => 'Mrs. Howell',
    hat      => 'Chartreuse?',
    shirt    => 'Apricot?',
    position => 'Islander?',
    location => 'The Island Country Club',
  },
);

foreach my $crewmember (@crew) {
  printf ( "%s at %s\n", @$crewmember{qw( name location )} );
}

