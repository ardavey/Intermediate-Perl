#!/usr/bin/perl

use 5.010;
use warnings;
use strict;
use autodie;
use IO::Tee;

my $file = 'output.file';
my $string;

print "please select type - file/scalar/both: ";
chomp( my $type = lc <STDIN> );

my $fh;
if ( $type eq 'file' ) {
  open $fh, '>>', $file;
}
elsif ( $type eq 'scalar' ) {
  open $fh, '>>', \ $string;
}
elsif ( $type eq 'both' ) {
  open my $scalarft, '>>', \ $string;
  open my $fileft, '>>', $file;
  $fh = IO::Tee->new( $scalarft, $fileft );
}
else {
  die "filetype not recongnized\n";
}
my $dow = qw( Sun Mon Tue Wed Thu Fri Sat )[(localtime)[6]];
my ( $sec, $min, $hour, $day, $mon, $yr ) = localtime;

print $fh "$dow $yr-$mon-$day $hour:$min:$sec";

say $string if defined $string;
