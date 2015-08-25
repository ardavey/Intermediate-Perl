#!/usr/bin/perl

use strict;
use warnings;

use Horse;
use Sheep;

my $tv_horse = new Horse( name => 'Mr. Ed' )
  ->name('Mister Ed')
  ->colour('grey');

print $tv_horse->name, ' is ', $tv_horse->colour, "\n";
print Sheep->name, ' colored ', Sheep->colour, ' goes ', Sheep->sound, "\n";
