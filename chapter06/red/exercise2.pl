#!/usr/bin/perl
use warnings;
use strict;
use JSON;

my $db = '.coconet.json';
my %stats;

if ( -s $db ) {
  my $store = decode_json do {
    local $/ = undef;
    open my $fh, '<:encoding(UTF-8)', $db;
    <$fh>
  };
  %stats = %$store;
}

my $fn = shift @ARGV // 'coconet.dat';
open my $fh, '<', $fn;

while( <$fh> ) {
  next if /^\s*(#.*)?$/;
  my ( $src, $dest, $bytes ) = split;
  $stats{$src}{$dest} += $bytes;
}

close $fh;

open my $out, '>:utf8', $db;
print $out encode_json( \%stats, { pretty => 1 } );
close $out;

for my $src ( sort keys %stats ) {
  print $src, "\n";

  for my $dest ( sort keys %{ $stats{$src} } ) {
    print "  $dest $stats{$src}{$dest}\n";
  }
}

