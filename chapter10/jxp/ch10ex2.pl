#!/usr/bin/perl
use strict;
use warnings;
use Benchmark;
use v5.14;

my ($dirname) = $ARGV[0];
opendir (my $dh, $dirname);
my @filenames;
while ( readdir $dh ){
  if ( -d $_ ){
    next;
  }
  push @filenames, $_;
}

my $t0 = Benchmark->new();
my @sorted = sort { -s ($dirname .'/'. $b) <=> -s ($dirname .'/'. $a) } @filenames;
my $t1 = Benchmark->new();

my $td1 = timediff($t1, $t0);

#Just to check the result is the same as ex1.
foreach my $name ( @sorted ){
  say $name;
};

my $t02 = Benchmark->new();
my @sort_names=
map $_->[0],
sort { $b->[1] <=> $a->[1] }
map [ $_,  -s ($dirname .'/'. $_)  ],
@filenames;
my $t12 = Benchmark->new();

my $td2 = timediff($t12, $t02);

say "First sort", timestr($td1);
say "Second sort", timestr($td2);
