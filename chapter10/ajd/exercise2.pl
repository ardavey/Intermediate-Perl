#!/usr/bin/perl

use strict;
use warnings;
use Benchmark qw( :all );

sub naive {
  chdir;
  my @sorted = sort { -s $a <=> -s $b } glob '*';
  # Explicit return value to stop the array being returned
  # Turns out Benchmark goes off and tests all the scripts that this returns
  return 1;
}

sub schwartz {
  chdir;
  my @schwartz = map { $_->{name} }
                 sort { $a->{size} <=> $b->{size} }
                 map { { name => $_, size => -s $_ } }
                 glob '*';
  return 1;
}

# Run for 60 seconds and compare the results
my $result = cmpthese( -60 , {
    'naive' => &naive,
    'schwartz' => &schwartz,
    } );

# Answer: About 2-8% faster apparently

