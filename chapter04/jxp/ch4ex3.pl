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

my %mr_howell_info = (
	name     => 'Mr Howell', 
	hat      => 'Red', 
	shirt    => 'Black', 
	position => 'Researcher',
);
my %mrs_howell_info = (
	name     => 'Mrs Howell',
	hat      => 'Green',
	shirt    => 'Black',
	position => 'Navigator',
);

my @crew = (\%gilligan_info, \%skipper_info,\%mr_howell_info,\%mrs_howell_info);

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
    $crewmember->{'location'}= "The Island";
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
	if ( $crewmember->{'name'} =~ /Howell/ ) {
	  $crewmember->{'location'}= "The Island Country Club";
	}
	printf "\n$crewmember->{'name'} at $crewmember->{'location'}\n";
}
