#! /usr/bin/perl

use strict;
use warnings;
use Benchmark qw(:all);

my @files = glob '*';

timethese( 0, {
             'Lazy' => "lazy( @files )",
             'Schwartzian' => "schwartz( @files )",
             }
           );


# Lazy style
sub lazy {
  my @lazy_sorted = sort { -s $a <=> -s $b } @_;
}

# Power of the Schwartz
sub schwartz {
  my @sorted =
    map { $_->[0] }
    sort { $a->[1] <=> $b->[1] }
    map [ $_, get_size( $_ ) ],
    @_;
}

sub get_size {
  my ( $file ) = @_;

  return ( -s $file );
}
