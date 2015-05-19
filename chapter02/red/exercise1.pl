#!/usr/bin/perl

use strict;
use warnings;
use File::Spec;

printf( "%-4s%s\n", ' ', File::Spec->rel2abs( $_ ) ) for <*>;
