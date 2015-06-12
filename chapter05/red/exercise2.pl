#!/usr/bin/perl

use warnings;
use strict;
use List::Util qw( reduce );

my $fn = shift @ARGV // 'coconet.dat';
open my $fh, '<', $fn;

my %stats;
while( <$fh> ) {
  next if /^\s*(#.*)?$/;
  my ( $src, $dest, $bytes ) = split;
  $stats{$src}{$dest} += $bytes;
}

close $fh;

my @sources =
  sort { $b->{size} <=> $a->{size} }
  map { { addr => $_, size => reduce { $a + $b } values $stats{$_} } } keys %stats;

for my $src ( @sources ) {
  print "$src->{addr}: $src->{size}\n";
  my $log = $stats{$src->{addr}};

  for my $dest ( sort { $log->{$b} <=> $log->{$a} } keys %$log ) {
    print "$src->{addr} => $dest: $log->{$dest}\n";
  }
}
