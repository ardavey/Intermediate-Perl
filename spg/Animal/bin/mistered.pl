#!/usr/bin/perl

use strict;
use warnings;

use Animal;
use Horse;
use Sheep;

my $tv_horse = Horse->new('Mr. Ed');
$tv_horse->set_name('Mister Ed');
$tv_horse->set_colour('grey');
print $tv_horse->name(), ' is ', $tv_horse->colour(), "\n";
print Sheep->name(), ' coloured ', Sheep->colour(), ' goes ', Sheep->get_voice(), "\n";
