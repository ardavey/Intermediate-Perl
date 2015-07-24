#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use File::Spec::Functions;
use Data::Dumper;
use Getopt::Long;

my ( $threshold, $traversal );
my ( $path ) = @ARGV;
$path //= '.';

GetOptions( 't|threshold=n' => \$threshold,
            'r|traversal=s' => \$traversal );

$threshold //= -1;
$traversal //= 'breadth-first';

my $data = data_for_path( $path, $threshold, $traversal, sub {
    my ( $path, $depth ) = @_;

    print "Adding `$path` at depth $depth\n";
  }
);

print 'Found the following directory structure: ', Dumper( $data );

sub data_for_path {
  my( $path, $threshold, $traversal, $on_entry ) = @_;

  my $root = {};
  my @queue = [ $path, 0, $root ];

  my %ops = ( 'depth-first' => sub { unshift @queue, @_ },
              'breadth-first' => sub { push @queue, @_ } );

  my $op;
  $op = $ops{$traversal} if defined $traversal;
  $op //= $ops{'depth-first'};

  traverse_path_from_work_queue( \@queue, $op, $threshold, $on_entry // sub {} );
  $root;
}

sub traverse_path_from_work_queue {
  my ( $queue, $add_work, $threshold, $on_entry ) = @_;

  while( my $next = shift @$queue ) {
    my( $path, $level, $contents ) = @$next;
    my $basename = basename( $path );
    $on_entry->( $path, $level );

    $contents->{$basename} = do {
      if ( -f $path or -l $path ) { undef }
      else {
        my $entries = {};

        if ( $level < $threshold or $threshold < 0 ) {
          opendir my ( $dh ), $path;

          my @paths = map { catfile( $path, $_ ) }
            grep { ! /^\.\.?\z/ } readdir $dh;

          $add_work->( map { [ $_, $level + 1, $entries ] } @paths );
        }

        $entries
      }
    };
  }
}
