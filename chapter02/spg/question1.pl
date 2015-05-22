#!/usr/bin/perl

use strict;
use warnings;

use File::Spec;
use Cwd;

my $dir = Cwd::getcwd;

foreach my $file ( glob("*") ) {
  print "    ", File::Spec->catfile( $dir, $file ), "\n"; 
}