#!perl

use strict;
use warnings;
use utf8;

use File::Find;
use Time::Local qw( timelocal_nocheck );

my $target_dow = $ARGV[0];        # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow, $yrday ) = localtime;

# This is dumb but we have to add one day because localtime 
# and timelocal_nocheck don't use day of year the same way
$yrday++;

while ($dow != $target_dow) {
  # Back up one day
  if (--$dow < 0) {
    $dow += 7;
  }
  if (--$yrday < 1) {

    # If we're somehow below 1900, die
    if (--$yr < 0) {
      print "Time traveller!";
      exit;
    }

    # Leap years...
    if ( $yr % 4 == 0 ) {
      if ( $yr % 100 == 0 && $yr % 400 != 0 ) {
        $yrday += 365;
      }
      else {
        $yrday += 366;
      }
    }
    else {
      $yrday += 365;
    }
  }
}

my $start = timelocal_nocheck(0, 0, 0, $yrday, 0, $yr);        # midnight on target day

my $stop = $start + $seconds_per_day;                          # 24 hours later

my($gather, $yield)  = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->(  );

for my $file (@files) {
  my $mtime = (stat $file)[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}

sub gather_mtime_between {
  my ($start, $stop) = @_;

  my @files;
  my $gather = sub { 
    my $modified = (stat $_)[9];
    if ( $modified > $start && $modified < $stop ) {
      push @files, $File::Find::name;
    }
  };
  my $yield = sub { return @files };

  return ( $gather, $yield );
} 
