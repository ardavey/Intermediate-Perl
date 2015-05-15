#!/usr/bin/perl
use strict;
use warnings;

use 5.014;

use Try::Tiny;

# Write a program that asks the user to enter a pattern (regular expression).
# Read this as data from standard input; don’t get it from the command line
# arguments. Report a list of files in some hardcoded directory (such as "/etc"
# or 'C:\\Windows') whose names match the pattern. Repeat this until the user
# enters an empty string instead of a pattern. The user should not type the
# slashes traditionally used to delimit pattern matches in Perl; the input
# pattern is delimited by the trailing newline. Ensure that a faulty pattern,
# such as one with unbalanced parentheses, doesn’t crash the program.

my $target_dir = '/etc/';

chdir $target_dir;

my @files = glob( '* .*' );

while ( 1 ) {
  print 'Enter regex: ';
  chomp( my $regex = <STDIN> );
  last unless ( defined $regex && length $regex );
  
  say "Files in $target_dir which match $regex:";
  
  print
    map { "    $_\n" }
    grep { eval { /$regex/ } }
    glob( '* .*' );
}
  

