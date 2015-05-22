#!/usr/bin/perl

use strict;
use warnings;

use Cwd qw( abs_path );

# read current dir
# list files with full path name (with four spaces before and newline after)
# only use modules, no shell

print ( "    " . abs_path( $_ ) . "\n" ) foreach glob '*';

