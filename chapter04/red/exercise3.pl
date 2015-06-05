#!/usr/bin/perl
use strict;
use warnings;

my @crew = ({
    name => 'Gilligan',
    hat => 'White',
    shirt => 'Red',
    position => 'First Mate',
    location => 'The Island'
  }, {
    name => 'Skipper',
    hat => 'Black',
    shirt => 'Blue',
    position => 'Captain',
    location => 'The Island'
  }, {
    name => 'Mr. Howell',
    hat => 'Yellow',
    shirt => 'Red',
    position => 'Millionaire',
    location => 'The Island'
  }, {
    name => 'Mrs. Howell',
    hat => 'Red/Green',
    shirt => 'White',
    position => 'Socialite',
    location => 'The Island'
  });

$_->{location} = 'The Island Country Club' for grep $_->{name} =~ /Howell/, @crew;

printf "%s at %s\n", @$_{qw( name location )} for @crew;

