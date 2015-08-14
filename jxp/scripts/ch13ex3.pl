#!/usr/bin/perl
use strict;
use warnings;
use Person;
use v5.10;

say "Without parameter";
Person->speak();

say "With parameter";
Person->speak("Hello World!");