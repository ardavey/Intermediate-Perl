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
  name     => 'Mr. Howell',
  hat      => 'White',
  shirt    => undef,
  position => 'Stowaway',
);

my %mrs_howell_info = (
  name     => 'Mrs. Howell',
  hat      => undef,
  shirt    => 'Green',
  position => 'Stowaway',
);

my @crew = ( \%gilligan_info, \%skipper_info, \%mr_howell_info, \%mrs_howell_info );


foreach my $person ( @crew ) {
  if ( $person->{name} =~ m/ Howell$/ ) {
    $person->{location} = 'The Island Country Club';
  }
  else {
    $person->{location} = 'The Island';
  }
  
  print "$person->{name} is at $person->{location}.\n";
}
