#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use Benchmark qw( timethese );

my $naive = sub {
  chdir;
  my @sorted = sort { -s $a <=> -s $b } glob '*';
};
my $schwartzian = sub {
  chdir;
  my @sorted = map { $_->[0] } sort { $a->[1] <=> $b->[1] } map { [ $_, -s $_ ] } glob '*';
};

timethese( 5000, {
             naive => $naive,
             schwartzian => $schwartzian,
             }
           );
