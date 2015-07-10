#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use IO::Tee;

open my $string_fh, '>', \ my $string or die "Can't open string handle: $@";
open my $file_fh, '>', "temp" or die "Can't open file handle: $@";

my $fh = {
  1 => $string_fh,
  2 => $file_fh,
  3 => IO::Tee->new( $string_fh, $file_fh ),
};

my ( $day, $month, $year, $dow ) = (localtime)[3..6];
++$month;
$year += 1900;

print "Welcome to the super awesome chanpter 8 date script\n\n";
print "Because we are super nice you have a range of options of how to get the date\n\n";
print "If you want it on screen press 1\n";
print "If you want it in a file press 2\n";
print "If you are greedy and want both press 3\n";
print "if you think you have time traveled here run around shouting \"The year, what is the year\"\n\n>";

my $option = <STDIN>;

print "option: $option\n";

print "file handle: " . Dumper( $fh->{$option} ) ."\n";

printf {$fh->{$option}} "Today's date is %s/%s/%s and the day of the week is %s\n", $year, $month, $day, $dow;

print "$string\n";
