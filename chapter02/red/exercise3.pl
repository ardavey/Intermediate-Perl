#!/usr/bin/perl

use strict;
use warnings;
use Business::ISBN;

my $isbn = new Business::ISBN '9781449393090';
printf "Group code: [%s], Publisher Code: [%s]\n", $isbn->group_code, $isbn->publisher_code;
