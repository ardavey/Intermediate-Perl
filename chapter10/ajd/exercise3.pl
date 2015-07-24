#!/usr/bin/perl

use strict;
use warnings;

my @words = (
    'gilligan',
    'Ginger',
    'The Skipper',
    'Mrs. Howell',
    'Mary-Ann',
    'MR HOWELL',
    'the professor',
    );

# Naive sort for comparison
print join ( "\n", sort @words ) . "\n --- \n";

# Schwartzian
print join ( "\n",
    map { $_->{name} }
    sort { $a->{dict} cmp $b->{dict} }
    map { { name => $_, dict => transform( $_ ) } }
    @words )
  . "\n";


sub transform {
  my ( $string ) = @_;
  $string =~ tr/A-Z/a-z/;
  $string =~ tr/a-z//cd;
  return $string;
}

