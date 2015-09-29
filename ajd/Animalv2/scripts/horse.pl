#!/usr/bin/perl

use strict;
use warnings;

use Horse;

my $horse = Horse->new( name => 'Cloud Elephant', colour => 'black' );
$horse->speak();
$horse->admire();

$horse->name( 'Strawberry Tree' );
$horse->dye ( 'pink' );
$horse->admire();

