#!perl

use strict;
use warnings;
use utf8;

use local::lib; # Had to install DateTime locally

use File::Find;
use File::Spec;
use DateTime;

my $target_dow = 1;        #  Monday is 1 ... Sunday is 7
my @starting_directories = (".");

# Using DateTime as it handles DST and is tidier
my $date = DateTime->today();

# Find the most recent Monday
while ( $date->day_of_week != $target_dow ) {
  $date->subtract( days => 1 );
}

my($gather, $yield)  = gather_mtime_between( $date->epoch(), $date->add( days => 1)->epoch() );
find($gather, @starting_directories);
my @files = $yield->(  );

for my $file (@files) {
  my $mtime = (stat $file)[9];        # mtime via slice
  my $when = localtime $mtime;
  print "$when: $file\n";
}

# The function they wanted

sub gather_mtime_between {

  my ( $start, $stop ) = @_;
  my @files = ();

  my $gather = sub {
    my $mtime = ( stat $_ )[9];
    if ( $mtime > $start
      && $mtime < $stop ) {
      push ( @files, File::Spec->canonpath( $File::Find::name ) );
    }
  };

  my $yield = sub {
    @files = File::Spec->no_upwards( @files ) ;
    return wantarray ? @files : [ @files ];
  };

  return ( $gather, $yield );
}
