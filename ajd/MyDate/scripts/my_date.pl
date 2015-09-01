#!/usr/bin/perl

use strict;
use warnings;

use MyDate;
use Data::Dumper;

my $date = MyDate->new();

# Exercise 2
sub UNIVERSAL::debug {
  my $self = shift;
  print localtime . " @_\n";
}

# This doesn't get autoloaded since UNIVERSAL methods are checked
# before AUTOLOAD ones
$date->debug("Debugger");

# Exercise 1
printf( "The date is %04d-%02d-%02d\n", $date->year(), $date->month(), $date->date() );

# Time Travel
$date->year(1988);

printf( "The date is %04d-%02d-%02d\n", $date->year(), $date->month(), $date->date() );

# Carp
print $date->yellow();


