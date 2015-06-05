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

my %mrhowell_info = (
        name     => 'Mr. Howell',
        hat      => 'I Dunno',
        shirt    => '???',
        position => 'Some guy?',
        location => 'The Island',
);

my @crew = (\%gilligan_info, \%skipper_info, \%mrhowell_info);

my $format = "%-15s %-7s %-7s %-15s %-15s\n"; 
printf $format, qw( Name Shirt Hat Position Location ); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'},
                $crewmember->{'location'};
}

printf "%s at %s\n", $_->{name}, $_->{location} foreach @crew;

@crew[2]->{location} = 'The Island Country Club';

printf "%s at %s\n", $_->{name}, $_->{location} foreach @crew;
