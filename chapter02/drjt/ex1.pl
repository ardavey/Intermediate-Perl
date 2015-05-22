#!/usr/bin/perl
use 5.010;
use warnings;
use strict;
use File::Spec;
use Cwd;

say "    " . File::Spec->catfile(cwd() , $_) while <*>;
