#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use Data::Dumper;

if ( !scalar @ARGV ) {
    say "Please supply some directories...";
    exit 1;
}

foreach my $arg (@ARGV) {
    if ( -d -e $arg ) {
        opendir( my $fh, $arg );
        print_directory_contents( $fh, $arg );
    }
    else {
        say "Unknown dir $arg!";
    }
}

sub print_directory_contents {
    my ( $dh, $dirname ) = @_;

    while ( readdir $dh ) {
        say "$dirname/$_";
    }

}
