#!/usr/bin/perl

use strict;
use warnings;

use File::Find;
use Time::Local;

my $target_dow = 4;        # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);        # midnight today
while ($dow != $target_dow) {
  # Back up one day
  $start -= $seconds_per_day;        # hope no DST! :−)
  if (--$dow < 0) {
    $dow += 7;
  }
}
my $stop = $start + $seconds_per_day;

my($gather, $yield)  = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->(  );

for my $file (@files) {
  my $mtime = (stat $file)[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}

sub gather_mtime_between {
  my ( $files, $start, $stop ) = ( [], @_ );

  return ( sub{ push $files, $_ if( (stat)[9] <= $stop && (stat)[9] >= $start && ! m/^\.$/  ) }, sub{ return @{ $files } } );
}
