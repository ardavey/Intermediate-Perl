#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use Data::Dumper;

while (<>) {
    state $fhs;
    my ( $owner, $item ) = split /:/;

    if ( !defined $fhs->{$owner} ) {
        my $file_name = lc($owner) . ".info";
        $file_name =~ s/ //g;
        open my $fh, '>:encoding(UTF-8)', $file_name;
        $fhs->{$owner} = $fh;
    }

    print { $fhs->{$owner} } "$owner:$item";
}
