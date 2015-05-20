#!/usr/bin/perl

use strict;
use warnings;
use File::Spec;
use Cwd qw ( abs_path );

my $curdir=File::Spec->curdir();
foreach my $file ( my @files=<$curdir/*> ){
  print ( " " x4 . abs_path( $file ) . "\n" );
}
