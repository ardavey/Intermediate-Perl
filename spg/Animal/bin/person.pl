#! /usr/bin/perl

use strict;
use warnings;

require '../lib/Human.pm';
require '../lib/Sheep.pm';

Human->speak("Hello, world!");

# A wild sheep approaches
Sheep->speak( "Baa-Ram-Ewe" );

# How does the person response to this shocking encounter?
Human->speak( "What a cute wooly critter" );
Human->speak();

