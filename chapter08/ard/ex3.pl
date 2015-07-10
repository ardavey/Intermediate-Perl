#!/usr/bin/perl
use strict;
use warnings;

use 5.010;

use IO::Dir;

my @dirs;

foreach my $arg ( @ARGV ) {
  if ( -d $arg ) {
    push @dirs, $arg;
  }
  else {
    say "'$arg' is not a valid directory";
  }
}

my @dir_handles = map { my $dh = IO::Dir->new( $_ ); $dh } @dirs;

for ( my $i = 0; $i <= $#dirs; $i++ ) {
  say "Contents of '$dirs[$i]':";
  print_file_list( $dir_handles[$i] );
}


sub print_file_list {
  my ( $dh ) = @_;
  
  while ( defined( my $file = $dh->read ) ) {
    next if ( $file =~ m/^\.\.?$/ );
    printf( "  %s\n", $file );
  }
  
}
