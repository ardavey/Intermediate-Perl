#!/usr/bin/perl
use strict;
use warnings;

my @crew = ();
push @crew, add_crew( 'Gilligan', 'White', 'Red', 'First Mate', 'The Island' );
push @crew, add_crew( 'Skipper', 'Black', 'Blue', 'Captain', 'The Island' );
push @crew, add_crew( 'Mr Howell', 'Viridian', 'Pewter', 'Some guy', 'The Island' );
push @crew, add_crew( 'Mrs Howell', 'Cerulean', 'Vermillion', "Some guy's wife", 'The Island' );


my $format = "%-15s %-10s %-10s %-15s\n";
printf $format, qw(Name Shirt Hat Position);

foreach my $crewmember (@crew) {
	printf $format, @$crewmember{qw(name shirt hat position)};
}

foreach my $crewmember (@crew) {
	if ( $crewmember->{name} =~ /howell/i ) {
		$crewmember->{location} = 'The Island Country Club';
	}
	
	printf "%-15s at %-30s\n", @$crewmember{qw(name location)};
}


sub add_crew {
	my ( $name, $hat, $shirt, $position, $location ) = @_;

	return { name     => $name,
			 hat      => $hat, 
			 shirt    => $shirt, 
			 position => $position, 
			 location => $location
			 };
}