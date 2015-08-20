#!/usr/bin/perl

use strict;
use warnings;
use v5.12;

use Data::Dumper;

use Test::More tests=>3;

BEGIN {
  use_ok( 'Animal' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

ok( defined &Animal::speak, 'Animal::speak is defined' );

{ # Speak tests
    eval {Animal->speak()} or my $err = $@;
    like( $err, qr/Sound is unimplemented/, "Checking that Animal cannot speak without a sound");
}

