#!/usr/bin/perl
use strict;
use warnings;

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
);

my @crew = (\%gilligan_info, \%skipper_info);

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}
