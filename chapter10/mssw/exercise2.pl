#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Benchmark qw( :all );

sub human_friendly_sort {
    my @sorted = sort( { -s $a <=> -s $b } glob('*') );
}

sub cyborg_friendly_sort {
    my @sorted =
      map( $_->[0],
        sort( { $a->[1] <=> $b->[1] } map( [ $_, -s $_ ], glob('*') ) ) );
}

timethese(
    -10,
    {
        human_friendly_sort  => \&human_friendly_sort,
        cyborg_friendly_sort => \&cyborg_friendly_sort,
    }
);
