#!/usr/bin/perl
use strict;
use warnings;

my ( $pattern_repo ) = @ARGV;
if ( !defined $pattern_repo || !-r $pattern_repo ) {
  print "Please supply a file containing line delimited regular expressions.\n";
  exit 0;
}

open my $repo, '<', $pattern_repo or die "Failed to read pattern repository: $!";

my @patterns = eval { map { chomp; qr/$_/ } <$repo> };

die "Invalid regular expression: $@" if $@;
close $repo;

print "Enter some text. Come on, it'll be fun:\n";

while ( my $line = <STDIN> ) {
  print "$.: $line" if grep $line =~ $_, @patterns;
}

