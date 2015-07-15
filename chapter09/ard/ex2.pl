#!/usr/bin/perl
use strict;
use warnings;
use v5.12;

use File::Slurp;

my @lines = read_file( 'patterns' );
my @patterns;

foreach my $line ( @lines ) {
  chomp $line;
  my $pattern;
  eval {
    $pattern = qr/$line/
  };
  if ( $@ ) {
    warn "Invalid pattern: $@";
    next;
  }
  else {
    push @patterns, $pattern;
  }
}

while ( my $line = <> ) {
  chomp $line;
  foreach my $pattern ( @patterns ) {
    if ( $line =~ m/$pattern/ ) {
      say "Matched /$pattern/ at line $.: $line";
    }
  }
}
