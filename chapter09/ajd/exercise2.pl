#!/usr/bin/perl

use strict;
use warnings;
use v5.14;

use File::Slurp;

# read a file of regexes
# ask the user for some text
# print the line number for each line that matches one

my @regexes;
foreach ( read_file( 'regexes.txt' ) ) {
  chomp;
  eval {
    push ( @regexes, qr/$_/ );
  };
  if ( $@ ) { warn( "Invalid regex /$_/ : $@\n" ) } 
}

print "Provide some lines of input, Ctrl-D to end\n";
my %matches;
while ( my $line = <> ) {
  if ( $line ~~ @regexes ) {
    $matches{$.} = $line;
  }
}

foreach my $match ( sort { $a <=> $b } keys %matches ) {
  print "Line $match matches: $matches{$match}";
}




