#!/usr/bin/perl

use v5.12;
use strict;
use warnings;
use diagnostics;
binmode STDOUT, ':utf8';

use Data::Dumper;
use Regexp::Assemble;

my $patterns_file = 'patterns.dat';

if ( !-f -e $patterns_file ) {
    print "Unable to find patterns file '$patterns_file'!";
    exit 1;
}

print "Compiling patterns...\n";

open my $fh, '<:encoding(UTF-8)', $patterns_file;

my $capn_regex        = new Regexp::Assemble();
my $formatting_length = 0;
while ( my $pattern = <$fh> ) {
    chomp $pattern;
    my $regex = qr/$pattern/;

    eval { '' =~ $regex };
    if ($@) {
        print STDERR "Invalid pattern '$pattern'\n";
    }
    else {
        add $capn_regex($regex);
        my $length = length $regex;
        $formatting_length =
          ( $length > $formatting_length ) ? $length : $formatting_length;
    }
}
close $fh;

print
  "Patterns compiled. Please enter something to match ('!end' to finish):\n";
my %lines;
while ( my $input = <STDIN> ) {
    chomp($input);

    last if $input eq '!end';
    $lines{$.} = $input;
}

my $super_pattern = $capn_regex->re;
print "MIKE: super pattern: $super_pattern\n";
my @matches;
foreach my $line_number ( sort keys %lines ) {
    if ( $lines{$line_number} =~ $super_pattern ) {
        push @matches,
          sprintf( "%03d /%-${formatting_length}s/ : %s",
            $line_number, $super_pattern, $lines{$line_number} );
    }
}

print "The following lines matched:\n";
say foreach @matches;
