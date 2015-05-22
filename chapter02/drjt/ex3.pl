#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use Business::ISBN;

printf "group code = %s\npublisher code = %s\n", $_->group_code(), $_->publisher_code() for (Business::ISBN->new('9781449393090'));

# my $isbn = Business::ISBN->new('9781449393090');
# printf "group code = %s\n", $isbn->group_code();
# printf "publisher code = %s\n" $isbn->publisher_code();
