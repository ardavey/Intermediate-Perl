#!/usr/bin/perl -w
use strict;
use warnings;
use 5.010;

use Time::Piece;
use IO::Handle;
use IO::Scalar;
use IO::Tee;

my $t = localtime;
my $output = sprintf( "Today is %s %u %s %u", $t->fullday, $t->day_of_month, $t->fullmonth, $t->year );

my $file_fh;
my $scalar_fh;

print "Output to File, Scalar or Both? [FSB] ";
my $choice = <STDIN>;

if ( lc( $choice ) eq 'f' ) {
  say "Writing to file $0.$$.out";
  $file_fh = IO::File->new( "$0.$$.out", '>' ) or die "Failed to open output file: $!";
}
elsif ( lc( $choice ) eq 's' ) {
  say "Writing to scalar";
  $scalar_fh = IO::Scalar->new();
}
elsif ( lc( $choice ) eq 'b' ) {

}
else {
  say "Unrecognised input - must be F,S or B.";
  exit 1;
}

