#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use File::Find;
use Time::Local;

# This is all mostly nicked from the book download bundle...
my $target_dow = 1;
my @starting_directories = qw( . );

my $seconds_per_day = 24 * 60 * 60;
my ( $sec, $min, $hour, $day, $mon, $yr, $dow ) = localtime;
my $start = timelocal( 0, 0, 0, $day, $mon, $yr );        # midnight today

while ( $dow != $target_dow ) {
  # Back up one day
  $start -= $seconds_per_day;        # hope no DST! :-)
  if ( --$dow < 0 ) {
    $dow += 7;
  }
}
my $stop = $start + $seconds_per_day;

my ( $gather, $yield )  = gather_mtime_between( $start, $stop );

find( $gather, @starting_directories );
my @files = $yield->(  );

foreach my $file ( @files ) {
  my $mtime = ( stat $file )[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}

# My own code follows...
sub gather_mtime_between {
  my ( $start, $end ) = @_;
  my @files;

  my $modded_between_times = sub {
    # only report on files
    if ( -f -e $_ ) {
      my $timestamp = ( stat $_ )[9];
      if ( $timestamp >= $start && $timestamp <= $end ) {
        push @files, $_;
      }
    }
    else {
      return;
    }
  };
  
  my $list_of_modded_files = sub {
    return @files;
  };
  
  return ( $modded_between_times, $list_of_modded_files );
}
