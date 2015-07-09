#!/usr/bin/perl

use strict;
use warnings;
use IO::Tee;
use Getopt::Long::Descriptive;

my ( $opt, $usage ) = describe_options( "$0 %o",
  [ 'file|f=s', 'Output date to file' ],
  [ 'scalar|s', 'Output date to memory' ],
  [ 'help|?',   'Print this usage info' ]
);

if ( $opt->help ) {
  print $usage->text, "\n";
}

my ( @handles, $out );
if ( defined $opt->file ) {
  open my $fh, '>', $opt->file or die "Failed to open file: $!";
  push @handles, $fh;
}

if ( $opt->scalar ) {
  open my $fh, '>', \$out;
  push @handles, $fh;
}

my $stream = new IO::Tee( @handles );

print $stream scalar localtime, "\n";

if ( defined $out ) {
  print STDOUT $out;
}
