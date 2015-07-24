#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

my @unsorted =
  qw( blarg honk Mary-Ann H@x0R --------------pie pi:3.14159265359 MaryANN Gravy sauron );

push @unsorted, 'Mary Ann';

sub dictionarise {
    my $string = shift;

    $string =~ tr/A-Z/a-z/;
    $string =~ tr/a-z//cd;
    return $string;
}

my @sorted = map( $_->[0],
    sort( { $a->[1] cmp $b->[1] } map( [ $_, dictionarise($_) ], @unsorted ) )
);

print "Sorted: " . Dumper( \@sorted );
