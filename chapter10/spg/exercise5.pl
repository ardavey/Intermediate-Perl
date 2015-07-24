#! /usr/bin/perl

use strict;
use warnings;
use File::Basename;
use File::Spec::Functions;

my $path = '..';

my $breadth_data = dump_data_for_path( $path, data_for_path( $path, 3, 'breadth' ), 0 );
my $depth_data = dump_data_for_path( $path, data_for_path( $path, 3, 'depth' ), 0 );

sub data_for_path {
  my ( $path, $threshold, $format ) = @_;

  if ( $format !~ /^(breadth|depth)$/ ) {
    print 'Invalid format!';
    return;
  }

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
          opendir my ( $dh ), $path;
          my @new_paths = map { catfile( $path, $_ ) } grep { !/^\.\.?\z/ } readdir $dh;
          if ( $format eq 'breadth' ) {
            push @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          }
          else {
            unshift @queue, map { [ $_, $level + 1, $hash ] } @new_paths;
          }
        }
        $hash;
      }
    };
  }

  $data;
} ## end sub data_for_path

sub dump_data_for_path {
  my ( $path, $data, $tabs ) = @_;

  if ( not defined $data ) { # plain file
    print "	" x $tabs, "$path\n";
    return;
  }

  if ( keys $data ) {
    print "	" x $tabs, $path, ", with contents of:\n";
    foreach ( sort keys $data ) {
      dump_data_for_path( "$path/$_", $data->{$_}, $tabs + 1 );
    }
  }
  else {
    print "	" x $tabs, $path, ", an empty directory\n";
  }
}
