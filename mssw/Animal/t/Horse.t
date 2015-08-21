#!/usr/bin/perl

use strict;
use warnings;
use v5.12;

use Data::Dumper;

use Test::More tests => 3;

BEGIN {
    use_ok('Horse') || print "Bail out!\n";
}

diag("Testing Horse $Horse::VERSION, Perl $], $^X");

ok( defined &Horse::sound, 'Horse::sound is defined' );

{    # Sound tests
    like( Horse->sound(), qr/neigh/, "checking Horse has a sound" );
}

