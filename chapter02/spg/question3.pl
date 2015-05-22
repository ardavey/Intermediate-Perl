#!/usr/bin/perl

use strict;
use warnings;

use Business::ISBN;

my $isbn = Business::ISBN->new('9781449393090');

print "Printing data for ISBN 9781449393090", "\n";
print "Group code: ", $isbn->group_code, "\n"; 
print "Publisher code: ", $isbn->publisher_code, "\n"; 
