#!/usr/bin/perl

use strict;
use warnings;
use v5.14.2;

if ( !@ARGV ) {
  die ( "Usage: $0 <island data file>\n" );
}

open ( my $input, '<', $ARGV[0] ) || die ( "Couldn't open input file\n" );

while ( my $line = <$input> ) {

  state $handles;

  if ( $line =~ /^(.*):/ ) {

    # Prep the file name
    my $file = lc($1);
    $file =~ s/\W//g;

    # Check whether there's a handle for it
    if (!defined $handles->{$file}) {
      open ( $handles->{$file}, '>>', "$file.info" ) || die ( "Can't open '$file' for writing: $!" ) ;
    }

    print { $handles->{$file} } $line;
  }
}

close ( $input );

