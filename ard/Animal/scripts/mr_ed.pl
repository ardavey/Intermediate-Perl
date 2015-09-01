#!/usr/bin/perl
use strict;
use warnings;

use lib '../lib';

use Horse;
use Sheep;

my $tv_horse = Horse->named('Mr. Ed');
$tv_horse->set_name('Mister Ed');
$tv_horse->set_colour('grey');
print $tv_horse->name, ' is ', $tv_horse->colour, "\n";
print Sheep->name, ' coloured ', Sheep->colour, ' goes ', Sheep->sound, "\n";

