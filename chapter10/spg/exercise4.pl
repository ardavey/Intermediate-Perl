#! /usr/bin/perl

use strict;
use warnings;

dump_data_for_path( ".", data_for_path("../.."), 0 ); 

sub dump_data_for_path {
  my ( $path, $data, $tabs ) = @_;

  if (not defined $data) { # plain file
    print "	" x $tabs, "$path\n";
    return;
  }

  if ( keys $data ) {
    print "	" x $tabs, $path, ", with contents of:\n";
    foreach (sort keys $data) {
      dump_data_for_path("$path/$_", $data->{$_}, $tabs + 1);
    }
  }
  else {
    print "	" x $tabs, $path, ", an empty directory\n";
  }
}

sub data_for_path {
  my $path = shift;
  if (-f $path or -l $path) {        # files or symbolic links
    return undef;
  }
  if (-d $path) {
    my %directory;
    opendir PATH, $path or die "Cannot opendir $path: $!";
    my @names = readdir PATH;
    closedir PATH;
    for my $name (@names) {
      next if $name eq '.' or $name eq '..';
      $directory{$name} = data_for_path("$path/$name");
    }
    return \%directory;
  }
  warn "$path is neither a file nor a directory\n";
  return undef;
}
