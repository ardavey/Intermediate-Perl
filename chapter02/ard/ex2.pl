#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

# Install the local::lib module and use it when you install Module::CoreList (or
# another module if you like). Write a program that reports the name and first
# release date for all the modules in Perl v5.14.2. Read the documentation for
# local::lib to see if it has special installation instructions.

use Module::CoreList;

my @modules = sort keys $Module::CoreList::version{5.014002};
my $display_width = 0;
foreach my $module ( @modules ) {
  if ( length $module > $display_width ) {
    $display_width = length $module;
  }
}

foreach my $module ( @modules ) {
  printf "%-*s => %s\n", $display_width, $module, $Module::CoreList::released{ Module::CoreList->first_release( $module ) };
};
