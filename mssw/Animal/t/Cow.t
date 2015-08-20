#!/usr/bin/perl

use strict;
use warnings;
use v5.12;

use Data::Dumper;

use Test::More tests => 3;

BEGIN {
    use_ok('Cow') || print "Bail out!\n";
}

diag("Testing Cow $Cow::VERSION, Perl $], $^X");

ok( defined &Cow::sound, 'Cow::sound is defined' );

{    # Sound tests
    like( Cow->sound(), qr/moo/, "checking Cow has a sound" );
}

