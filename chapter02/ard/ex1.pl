#!/usr/bin/perl
use strict;
use warnings;
use 5.014;

# Read the list of files in the current directory and convert the names to their
# full path specification. Don’t use the shell or an external program to get the
# current directory. The File::Spec and Cwd modules, both of which come with
# Perl, should help. Print each path with four spaces before it and a newline
# after it.

use File::Spec;
use Cwd;

my $cwd = getcwd();
my @files = glob( '* .*' );

foreach my $file ( @files ) {
  say ' ' x 4 . File::Spec->catfile( $cwd, $file );
}
