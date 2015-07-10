#!/usr/bin/perl

use strict;
use warnings;

my $file;
my $string;

print "Enter 1) for scalar filehandle, or 2) for file filehandle\n";

chomp ( my $input = <STDIN> );

if ( $input == 1 ) {
  open $file, '>', \ $string;
}
elsif ( $input == 2 ) {
  open $file, '>', 'date.out' or die "Could not open date.out: $!";
}
else { 
  print "Wrong move, chump";
  die;
}

my $date = localtime;
my $dow = (localtime)[6];

print $file "Date is: ", $date, " and day of week is: ", $dow;

if ( $input == 1 ) {
  print STDOUT "Scalar value is ", $string; 
}
