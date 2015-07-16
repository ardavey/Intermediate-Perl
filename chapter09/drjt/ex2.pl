#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use autodie;


my $patternfile = 'patterns.txt';
my $searchfile = $ARGV[0] or die "please specify a file\n";

open( my $fh, '<', $patternfile );
my @patterns;
while ( <$fh> ) {
  chomp;
  my $pattern = eval { qr/$_/ };
  if ( $@ ) {
    say "pattern $_ at line $. did not compile."
  }
  else {
    push @patterns, $pattern;
  }
}
close $fh;

open( my $search_fh, '<', $searchfile );
while ( <$search_fh> ) {
  chomp( my $input = $_ );
  foreach ( @patterns ) {
    say "$input matches $_ (line $.)" if $input =~ $_;
  }
}
close $search_fh
