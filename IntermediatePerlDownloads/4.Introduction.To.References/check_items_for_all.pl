#!/usr/bin/perl
use strict;
use warnings;

my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(sunscreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
	Gilligan  => \@gilligan, 
	Skipper   => \@skipper, 
	Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
	die "You need to fill in check_items_for_all";
}
