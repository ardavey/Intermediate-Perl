#!/usr/bin/perl

use strict;
use warnings;

use Horse;
use Sheep;

my $tv_horse = Horse->new( name => 'Mr. Ed' );
$tv_horse->name('Mister Ed');
$tv_horse->colour('grey');

print $tv_horse->name, ' is ', $tv_horse->colour, "\n";

# Sorry package method enthusiasts, only instances supported.
# print Sheep->name, ' colored ', Sheep->colour, ' goes ', Sheep->sound, "\n";
