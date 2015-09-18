#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use Horse::RaceHorse;

my $race_horse = new Horse::RaceHorse( 'Bessie');

$race_horse->won;

print $race_horse->standings, "\n";

$race_horse->speak;
