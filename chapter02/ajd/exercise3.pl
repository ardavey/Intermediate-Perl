#!/usr/bin/perl

use strict;
use warnings;

use Business::ISBN;

# Use Business::ISBN to parse - 9781449393090
# extract the group and publisher codes

my $isbn = new Business::ISBN( '9781449393090' );

print "Group Code: " . $isbn->group_code() . "\n";
print "Publisher Code: " . $isbn->publisher_code() . "\n";

