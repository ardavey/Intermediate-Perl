#!/usr/bin/perl
use strict;
use warnings;
use Cow;
use Horse;
use Sheep;
use Mouse;
use v5.10;

say "Please enter a list of Animals";
my $input = <STDIN>;

my @animals = split " ",$input;

foreach my $animal ( @animals ){
  $animal->speak();
}