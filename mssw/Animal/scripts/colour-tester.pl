#!/usr/bin/perl

use strict;
use warnings;

use Horse;
use Sheep;

my $tv_horse = new Horse('Mr. Ed');
$tv_horse->name('Mister Ed');
$tv_horse->colour('grey');
print $tv_horse->name, ' is ', $tv_horse->colour, "\n";
print Sheep->name, ' colored ', Sheep->colour, ' goes ', Sheep->sound, "\n";
