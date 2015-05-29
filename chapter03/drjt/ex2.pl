#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

print 'Input:';
while (<STDIN>) {
  chomp( my $pattern = $_ );
  last unless $pattern;
  printf "    %s\n", $_ for grep { eval { /$pattern/ } } </etc/*>;
  print "Input:";
}
