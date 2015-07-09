#!/usr/bin/perl -w
use strict;
use warnings;
use 5.010;

# use all of the IO modules!
use Time::Piece;
use IO::Handle;
use IO::Scalar;
use IO::Tee;

# nasty globals, but will do for now
my $output_handle; # this will ultimately point to our destination(s)
my $scalar;

my $t = localtime;
my $output_string = sprintf( "Today is %s %u %s %u", $t->fullday, $t->day_of_month, $t->fullmonth, $t->year );


print "Output to file, scalar or both? [fsb] ";
chomp( my $choice = lc( <STDIN> ) );
#$choice = lc( $choice );

my %dispatch = (
  f => \&do_file,
  s => \&do_scalar,
  b => \&do_both,
);

( $dispatch{$choice} || \&do_invalid )->(); 

print $output_handle $output_string;
say STDOUT '$scalar contains:';
say STDOUT defined $scalar ? $scalar : "(nothing)";  


sub do_file {
  say STDOUT "Writing to file $0.$$.out";
  $output_handle = get_file_handle();
}

sub do_scalar {
  say STDOUT "Writing to scalar";
  $output_handle = get_scalar_handle();  
}

sub do_both {
  say STDOUT "Writing to file and scalar";
  my $fh = get_file_handle();
  my $sh = get_scalar_handle();
  $output_handle = IO::Tee->new( $fh, $sh ) or die "Failed to create tee handle: $!";
}

sub do_invalid {
  say "Unrecognised input - must be F,S or B.";
  exit 1;
}

sub get_file_handle {
  my $handle = IO::File->new( "$0.$$.out", '>' ) or die "Failed to open file handle: $!";
  return $handle;
}

sub get_scalar_handle {
  my $handle = IO::Scalar->new( \$scalar, '>' ) or die "Failed to open scalar handle: $!";
  return $handle;
}
