#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

my $path = $ARGV[0] or die "usage: $0 <path>";
my $data = data_for_path( $path );
dump_data_for_path( $path, $data );

sub data_for_path {
  my $path = shift;
  if ( -f $path or -l $path ) { # files or symbolic links
    return undef;
  }
  if ( -d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name ( @names ) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path( "$path/$name" );
    }

    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}

sub dump_data_for_path {
  my $name = shift;
  my $data = shift;
  my $indent = shift // "";

  if ( not defined $data ) { # plain file
    say "$indent$name";
    return;
  }
  elsif ( !length %$data ) {
    say "$indent$name, an empty directory";
    return;
  }
  else { # directory
    say "$indent$name, with contents:";

    foreach ( sort keys %$data ) {
      dump_data_for_path( $_, $data->{$_}, "  $indent" );
    }
  }
}
