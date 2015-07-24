#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use File::Basename;
use File::Spec::Functions;
use Data::Dumper;

use File::Basename;
use File::Spec::Functions;

my $data = data_for_path( '../..', 'breadth-first' );
print Dumper $data;

sub data_for_path {
  my( $path, $mode ) = @_;

  my $data = {};
  my $code;

    $code = ( $mode == 'breadth-first' ) ? sub {
      my ( $queue, @paths ) = @_;
      push @$queue, @paths;
    } : sub {
      my ( $queue, @paths ) = @_;
      push @$queue, @paths;
    };

  my @queue = ( [ $path, $data ] );

  while( my $next = shift @queue ) {
    my( $path, $ref ) = @$next;

    my $basename = basename( $path );

    $ref->{$basename} = do {
      if( -f $path or -l $path ) { undef }
      elsif ( -d $path ) {
        my $hash = {};
        opendir my ($dh), $path;
        my @new_paths = map {
          catfile( $path, $_ )
          } grep { ! /^\.\.?\z/ } readdir $dh;

        $code->( \@queue, map { [ $_, $hash ] } @new_paths );
        $hash;
      }
    };
  }

  $data;
}
