#! /usr/bin/perl

use strict;
use warnings;

my @words = ( "Mary-Ann", "the Professor", "The Skipper", "Gilligan54b", "Gilligan12c", "Mr.Howell" );

print "Unordered words:", map { " $_" } @words, "\n" ;

my @ordered = 
  map { $_->[0] }
  sort { $a->[1] cmp $b->[1] }
  map [ $_, mangle_data($_) ],
  @words;

print "Ordered words:", map { " $_" } @ordered;

sub mangle_data {
  my ( $string ) = @_;

  $string =~ tr/A-Z/a-z/;
  $string =~ tr/a-z//cd; 
  
  return $string; 
}