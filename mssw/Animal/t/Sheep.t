#!/usr/bin/perl

use strict;
use warnings;
use v5.12;

use Data::Dumper;

use Test::More tests => 3;

BEGIN {
    use_ok('Sheep') || print "Bail out!\n";
}

diag("Testing Sheep $Sheep::VERSION, Perl $], $^X");

ok( defined &Sheep::sound, 'Sheep::sound is defined' );

{    # Sound tests
    like( Sheep->sound(), qr/ba/, "checking Sheep has a sound" );
}

