#!/usr/bin/perl

use v5.16;
use strict;
use warnings;

my ( $path ) = @ARGV;
$path //= '.';

dump_data_for_path( $path => data_for_path( $path ) );

sub dump_data_for_path {
  my ( $path, $dir, $depth ) = @_;
  $depth //= 0;

  print '  ' x $depth, $path;

  if ( defined $dir ) {
    if ( %$dir ) {
      print ", with contents:\n";
      __SUB__->( $_, $dir->{$_}, $depth + 1 ) for sort keys %$dir;
    }
    else {
      print ", an empty directory\n";
    }
  }
  else {
    print "\n";
  }
}

sub data_for_path {
  my $path = shift;

  if ( -d $path ) {
    return data_for_dir( $path );
  }
  elsif ( ! ( -f $path || -l $path ) ) {
    warn "$path is neither a file nor a directory\n";
  }

  return undef;
}

sub data_for_dir {
  my $path = shift;

  opendir my $dir, $path or die "Cannot opendir $path: $!";
  my @names = readdir $dir;
  closedir $dir;

  my %contents =
    map { $_ => data_for_path( "$path/$_" ) }
    grep { $_ !~ /^\.\.?$/ } @names;

  return \%contents;
}

