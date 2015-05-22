#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use local::lib;
use Module::CoreList;

printf( "%-40s | %s\n", $_, Module::CoreList->first_release($_) ) for Module::CoreList->find_modules( '', 5.014002 );
