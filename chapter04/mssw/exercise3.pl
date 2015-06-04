#!/usr/bin/perl
use strict;
use warnings;

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
    location => 'The Island',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
    location => 'The Island',
);
my %mr_howell_info = (
    name     => 'Mr Howell',
    hat      => 'invisible',
    shirt    => 'green',
    position => 'bait',
    location => 'The Island Country Club',
);
my %mrs_howell_info = (
    name     => 'Mrs Howell',
    hat      => 'yellow',
    shirt    => 'white',
    position => 'Bar Wench',
    location => 'The Island Country Club',
);

my @crew = (\%gilligan_info, \%skipper_info, \%mr_howell_info, \%mrs_howell_info);

my $format = "%-15s %-7s %-7s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}
print "\n";
for my $crewmember (@crew) {
    printf "%s is at %s\n", $crewmember->{name}, $crewmember->{location};
}