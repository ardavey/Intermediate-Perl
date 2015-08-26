#!/usr/bin/perl

use strict;
use warnings;

use Animal;
use Horse;
use Sheep;

my $tv_horse = Horse->new('Mr. Ed');
print $tv_horse->name(), ' is ', $tv_horse->colour(), "\n";
$tv_horse->set_name('Mister Ed')->set_colour('grey');
print 'Wait a moment, his name is ', $tv_horse->name(), ' and he is actually ', $tv_horse->colour(), "\n";

my $tv_horse_wife = Horse->new('Mrs. Ed','polkadot');
print $tv_horse_wife->name(), ' is ', $tv_horse_wife->colour(), "\n";

print Sheep->name(), ' coloured ', Sheep->colour(), ' goes ', Sheep->get_voice(), "\n";

Animal->set_name('animal');
