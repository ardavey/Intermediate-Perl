#!/usr/bin/perl

use strict;
use warnings;
use Business::ISBN;

my $input_isbn = "9781449393090";

my $isbn = Business::ISBN->new( $input_isbn );

print "Group code: " . $isbn->group_code . "\n";
print "Publisher code: " . $isbn->publisher_code . "\n";


