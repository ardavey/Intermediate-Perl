#!/usr/bin/perl

use strict;
use warnings;

my $promt = 'Please input your search term > ';

print "Welcome to the chapter 3 file search engine\n";

exit 1 if ( scalar @ARGV > 0 );

print "Well done you didn't use command line arguments :-)\n";

opendir my $dir, "/etc" or die "Cannot open /etc: $!";
my @files = readdir $dir;
closedir $dir;

print $promt;

while ( <STDIN> ) {
  chomp;
  if ( $_ eq '' ) {
    print "Exiting the chapter 3 file search engine\n";
    exit;
  }

  my $term = $_;

  my @results;
  eval {
    @results = grep {/$term/} @files;
  };
  if ( $@ ) {
    print "That search failed :-(\n";
  }
  else {
    print map { "$_\n" } @results if ( scalar @results > 0 );
  }

  print $promt;
}
