#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use v5.14.2;

my $path = $ARGV[0] || "/home/ajd";
my $data = data_for_path( $path );
#dump_data_for_path( $path, $data );
better_dump_data_for_path( $path, $data );

sub data_for_path {
  my ( $path ) = @_;

  if ( -f $path or -l $path ) {
    return undef;
  }
  elsif ( -d $path ) {
    my %directory;
    opendir ( my $dir, $path) || die ( "Can't open $path: $!\n" );
    my @names = grep !/^\./, readdir( $dir );
    closedir ( $dir );

    foreach my $name ( @names ) {
      $directory{$name} = data_for_path( "$path/$name" );
    }

    return \%directory;
  }
  warn "$path is broken somehow\n";
  return undef;
}

sub dump_data_for_path {
  my ( $path, $data ) = @_;

  if ( !defined $data ) { # plain file
    print "$path\n";
    return;
  }

  foreach ( sort keys %$data ) {
    dump_data_for_path( "$path/$_", $data->{$_} );
  }
}

sub better_dump_data_for_path {
  my ( $path, $data ) = @_;

  state $depth = 0;

  print '  ' x $depth, "$path";

  if ( !defined $data ) {
    print "\n";
  }
  else {
    if ( scalar keys $data ) {
      print ", with contents:\n";
      $depth++;
      foreach my $key ( sort keys $data ) {
        better_dump_data_for_path( $key, $data->{$key} );
      }
      $depth--;
    } else {
      print ", an empty directory\n";
    }
  }
}

