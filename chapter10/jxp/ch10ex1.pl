#!/usr/bin/perl
use strict;
use warnings;
use Benchmark;
use v5.14;

my ($dirname) = $ARGV[0];
opendir my $dh, $dirname;
my @filenames;
while ( readdir $dh ){
  if ( -d $_ ){
    next;
  }
  push @filenames, $_;
}

my @sort_names=
map $_->[0],
sort { $b->[1] <=> $a->[1] }
map [ $_,  -s ($dirname .'/'. $_)  ],
@filenames;

foreach my $name ( @sort_names ){
  say $name;
};
