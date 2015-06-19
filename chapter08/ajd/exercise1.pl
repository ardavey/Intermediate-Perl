#!/usr/bin/perl

use strict;
use warnings;

use IO::Tee;
use Getopt::Long;

my ( $file, $scalar );

GetOptions(
    'file=s' => \$file,
    'scalar' => \$scalar,
);

if ( ( !defined $file || $file eq '' ) && !defined $scalar ) {
  die( "Usage: $0 [--file|-f <output file>] [--scalar|-s]\n" );
}

if ( defined $file && -e $file ) {
  die( "'$file' already exists, exiting\n" );
}

my %handles;

if ( defined $scalar ) {
  open ( $handles{scalar}, '>', \$scalar ) || die ("Broken scalar: $!\n");
}

if ( defined $file ) {
  open ( $handles{file}, '>', $file ) || die ( "Couldn't open '$file' for writing': $!\n" );
}

my $tee = new IO::Tee( values %handles );
print $tee localtime . "\n"; # lazy date formatting
$tee->close();

# Have to print $scalar_output as otherwise we can't see it
if ( defined $scalar ) {
  print $scalar;
}

