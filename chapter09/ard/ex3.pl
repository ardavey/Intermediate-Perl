#!/usr/bin/perl
use strict;
use warnings;
use v5.12;

use File::Slurp;
use Regexp::Assemble;

my @lines = read_file( 'patterns' );
my $ra = Regexp::Assemble->new();

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
    $ra->add( $pattern );
  }
}

my $uber_regex = $ra->re();
say "Our mega-regex is: $uber_regex";

while ( my $line = <> ) {
  chomp $line;
  if ( $line =~ m/$uber_regex/ ) {
    say "Matched at line $.: $line";
  }
}
