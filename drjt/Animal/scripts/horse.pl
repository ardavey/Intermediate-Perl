#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use Horse;
use Sheep;

my $animal = Sheep->new('Shaun');
$animal->set_name('Shorn')
       ->set_colour('white');
say $animal->get_name(), ' is ', $animal->get_colour();
say Horse->get_name(), ' is coloured ', Horse->get_colour();
