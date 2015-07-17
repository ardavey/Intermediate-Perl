#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use Regexp::Assemble

  my $ra = Regexp::Assemble->new;

while ( <> ) {
  eval { $ra->add( "\Q$_" ); };

  if ( $@ ) {
    die "Invalid regex: $@";
  }
}

my $combined_regex = $ra->re;

print "Enter a line for pattern matching, or 'q' to quit\n";

while ( my $line = <STDIN> ) {

  if ( $line eq "q\n" ) {
    last;
  }

  if ( $line =~ $combined_regex ) {
    printf( "Line number %s, %s matches regex %s\n", $., $line, $regex );
  }

}

print "Closing";

exit;
