#! /usr/bin/perl

use strict;
use warnings;

# Lazy style
#chdir;  # the default is our home directory
#my @sorted = sort { -s $a <=> -s $b } glob '*';

my @files = glob '*';

print "Files in dir:", map { " $_" } @files, "\n" ;

# Power of the Schwartz
my @sorted = 
  map { $_->[0] }
  sort { $a->[1] <=> $b->[1] }
  map [ $_, get_size($_) ],
  @files;

print "Files sorted by size:", map { " $_" } @sorted;

sub get_size {
  my ( $file ) = @_;
  
  return ( -s $file ); 
}