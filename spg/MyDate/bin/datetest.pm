#! /usr/bin/perl

use strict;
use warnings;

use MyDate;

printf "Today is %s/%s/%s\n", MyDate->date(), MyDate->month(), MyDate->year();

eval {
  printf "Epoch Time in Planck Seconds: %s\n", MyDate->planck_seconds();
};

if ( $@ ) {
  print "Now I am Carp: $@";
}

MyDate->debug("random message");

sub UNIVERSAL::planck_seconds {
  (time)/5.39e-44;
}

# Just to satisfy the question...
sub UNIVERSAL::debug {
  printf "At timestamp %s, output %s from module %s\n", time, $_[1], $_[0];
}
