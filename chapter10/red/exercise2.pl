#!/usr/bin/perl

use utf8;
use strict;
use warnings;
use Benchmark;

my $iters = shift @ARGV // 100_000;
my @dir = glob '*';

timethese( $iters, {
  Naïve => sub {
      my ( undef ) = sort { -s $a <=> -s $b } @dir;
    },
  Schwartzian => sub {
      my ( undef ) =
        map $_->[0],
        sort { $a->[1] <=> $b->[1] }
        map [ $_, -s ], @dir;
    },
  });

