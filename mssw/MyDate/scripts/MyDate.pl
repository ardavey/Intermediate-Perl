#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use MyDate;

my $instance = new MyDate;

my $date  = $instance->date();
my $month = $instance->month();
my $year  = $instance->year();

printf "%u %s %u\n", $date, $month, $year;

sub UNIVERSAL::debug {
    my $self = shift;
    my $t    = localtime;
    print "$t: ", "@_", "\n";
}

$instance->debug("All finished");
