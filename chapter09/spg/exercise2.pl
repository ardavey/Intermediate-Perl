#!/usr/bin/perl
use utf8;
use strict;
use warnings;

my $regex;
my @regexes;

while ( <> ) {
  eval { $regex = qr/$_/; };

  if ( $@ ) {
    die "Invalid regex: $@";
  }
  push @regexes, $regex;

}
print @regexes;

print "Enter a line for pattern matching, or 'q' to quit\n";

while ( my $line = <STDIN> ) {

  if ( $line eq "q\n" ) {
    last;
  }
  foreach my $regex ( @regexes ) {
    if ( $line =~ $regex ) {
      printf( "Line number %s, %s matches regex %s\n", $., $line, $regex );
    }
  }
}

print "Closing";

exit;
