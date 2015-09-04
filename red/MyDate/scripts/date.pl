#!/usr/bin/perl

use strict;
use warnings;
use MyDate;

my $date = new MyDate;

printf "It is %02d/%02d/%04d\n",
  $date->date, $date->month, $date->year;

$date->debug( 'It is done.' );

sub UNIVERSAL::debug {
  shift;
  print scalar localtime, ': ', @_, "\n";
}
