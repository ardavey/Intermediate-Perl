#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

my @input = <STDIN>;
say "\n\nSorted Data:";
print $_ foreach map { $_->[0] } sort { $a->[1] cmp $b->[1] } map { [ $_, dictionary_transform( $_ ) ] } @input;

sub dictionary_transform {
  my $string = shift;
  $string =~ tr/A-Z/a-z/;
  $string =~ tr/a-z//cd;
  return $string;
}
