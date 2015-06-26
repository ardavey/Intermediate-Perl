#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use Business::ISBN;

use constant {
    ISBN => '9781449393090',
};

my $isbn = Business::ISBN->new( ISBN );

my $group_code = $isbn->group_code;
my $publisher_code = $isbn->publisher_code;


print "Group code:\t$group_code\n";
print "publisher_code:\t$publisher_code\n";
