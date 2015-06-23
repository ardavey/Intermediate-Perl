#!/usr/bin/perl

use strict;
use warnings;

use local::lib;
use Module::CoreList;

my @modules = sort keys $Module::CoreList::version{5.014002};

foreach my $module ( @modules ){
    my $first_release = Module::CoreList->first_release($module); 
    printf( "%-50s %s\n", $module, $first_release);
}
