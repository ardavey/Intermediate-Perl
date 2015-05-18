#!/usr/bin/perl

use strict;
use warnings;

use local::lib '/home/ajd/perl5/';
use Module::CoreList;
use Data::Dumper;

# using Module::CoreList or some other module
# print the name and first release date for all modules in v5.14.2

foreach my $module ( sort keys $Module::CoreList::version{5.014002} ) {

  print "$module => " . $Module::CoreList::released{ Module::CoreList->first_release( $module ) } . "\n";

}
