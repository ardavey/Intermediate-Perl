#!/usr/bin/perl
use strict;
use warnings;
use Regexp::Assemble;

my ( $pattern_repo ) = @ARGV;
if ( !defined $pattern_repo || !-r $pattern_repo ) {
  print "Please supply a file containing line delimited regular expressions.\n";
  exit 0;
}

my $regex = eval { new Regexp::Assemble( file => $pattern_repo )->re };
die "Invalid regular expression: $@" if $@;

print "Enter some text. Come on, it'll be fun:\n";

while ( <STDIN> ) {
  print "$.: $_" if /$regex/;
}

