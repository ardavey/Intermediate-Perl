#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use File::Basename;
use File::Spec::Functions;

my $breadth = $ARGV[0] ;

my $data = data_for_path( "/home/ajd", 2, $breadth );
print Dumper( $data );

sub data_for_path {
  my ( $path, $threshold, $breadth_first ) = @_; # Changed

  my $data = {};

  my @queue = ( [ $path, 0, $data ] );

  while ( my $next = shift @queue ) {
    my ( $path, $level, $ref ) = @$next;

    my $basename = basename( $path );
    $ref->{$basename} = do {
      if ( -f $path or -l $path ) { undef }
      else {
        my $hash = {};
        if ( $level < $threshold ) {
          opendir my ($dh), $path;
          my @new_paths = map {
            catfile( $path, $_ );
          } grep { ! /^\.\.?\z/ } readdir ( $dh );

          # Added this part
          if ( $breadth_first ) {
            push ( @queue, map { [ $_, $level + 1, $hash ] } @new_paths );
          }
          else {
            unshift ( @queue, map { [ $_, $level + 1, $hash ] } @new_paths );
          }
        }
        $hash;
      }
    };
  }
  $data;
}


