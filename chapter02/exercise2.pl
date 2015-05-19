#!/usr/bin/perl

use strict;
use warnings;
use Module::CoreList;

my %modules =
  map { $_ => $Module::CoreList::released{ Module::CoreList->first_release( $_ ) } }
  keys $Module::CoreList::version{5.014002};

printf( "%48s [%s]\n", $_, $modules{$_} ) for sort keys %modules;
