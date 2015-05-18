#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use File::Slurp;

# Read some filenames from /etc, then let the user enter some regexes
# show which files match, deal with any errors
# If this looks suspiciously similar to 17.1 from the last book, it is.

# Read the files
my @files = glob '/etc/*';

print "Checking /etc files. Enter a pattern to match (blank to exit): ";

while ( my $pattern = <STDIN> ) {
  chomp ( $pattern );

  # Bail if there's no pattern
  if ( !$pattern ) {
    last;
  }

  # Capture the matching files
  my @matches;
  eval {
    @matches = grep ( /$pattern/, @files );
  };

  # Catch fails or print matches, whichever works
  if ( $@ ) {
    print ( "Invalid pattern, try again: ");
  } else {
    # Might have used a join here, but map was the theme of the chapter
    print "The following files matched:\n" , map { "$_\n" } @matches;
    print "Enter another pattern (blank to exit): ";
  }
}

