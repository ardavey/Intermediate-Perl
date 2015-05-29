#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

while ( 1 ){

  print ( "Please enter a regular expression\n" );
  
  my $input = <STDIN>;
  if ( !defined $input || $input eq "\n" ){
    last;
  }
  $input =~ s/\n//;
  
  my @files = <~/Documents/*>;
  @files = map basename($_), @files;
  my @results = eval{ grep m/$input/, @files };
  
  if ( @results ){
    @results = map $_ . "\n", @results;
    print ( @results );
  }
  
}