#!/usr/bin/perl

use strict;
use warnings;

use RaceHorse;

my @horses = map { RaceHorse->new($_) } qw( Peter Archibald Fernando );
my @results = qw( won placed showed lost );

# Run some races!
for ( 1..10 ) {
  my $horse = $horses[ int( rand( scalar( @horses ) ) ) ];
  my $result = $results[ int( rand( scalar( @results ) ) ) ];
  $horse->$result;
}

# Post race interviews
foreach my $horse( @horses ) {
  print $horse->name(), " results: ", $horse->standings(), "\n";

  if ( rand > 0.5 ) {
    $horse->speak();
  }
}
