#!/usr/bin/perl

use strict;
use warnings;
use v5.14;

use Module::CoreList;
use Business::ISBN;

foreach my $module ( sort keys $Module::CoreList::version{5.014002} ) {
  print $module, ' ' , Module::CoreList::first_release_by_date( $module ), "\n"
}