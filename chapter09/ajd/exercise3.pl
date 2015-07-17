#!/usr/bin/perl

use strict;
use warnings;
use v5.14;

use Regexp::Assemble;

# read a file of regexes
# ask the user for some text
# print the line number for each line that matches one
# Use Regexp::Assemble this time

my @regexes;
my $ra = new Regexp::Assemble();

# Cool callback function to filter out invalid regexes
$ra->pre_filter( sub { 
    eval { qr/$_[0]/ };
    if ( $@ ) {
      warn ( "'$_[0]' is invalid : $@\n" );
      return 0;
    }
    return 1;
  });
$ra->add_file( 'simple_regexes.txt' );

print $ra->re() . "\n";

print "Provide some lines of input, Ctrl-D to end\n";
my %matches;
while ( my $line = <> ) {
  if ( $line =~ $ra->re() ) {
    $matches{$.} = $line;
  }
}

foreach my $match ( sort { $a <=> $b } keys %matches ) {
  print "Line $match matches: $matches{$match}";
}

