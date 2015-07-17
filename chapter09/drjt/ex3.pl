#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use autodie;
use Regexp::Assemble;


my $patternfile = 'patterns.txt';
my $searchfile = $ARGV[0] or die "please specify a file\n";

open( my $fh, '<', $patternfile );
my $bigpattern = new Regexp::Assemble;
while ( <$fh> ) {
  chomp;
  my $pattern = eval { qr/$_/ };
  if ( $@ ) {
    say "pattern $_ at line $. did not compile."
  }
  else {
    $bigpattern->add( $pattern );
  }
}
close $fh;

open( my $search_fh, '<', $searchfile );
while ( <$search_fh> ) {
  chomp( my $input = $_ );
    say "$input matches $_ (line $.)" if $input =~ $bigpattern;
}
close $search_fh
