#!/usr/bin/perl
use strict;
use warnings;

use File::Find;
use Date::Calc qw( Day_of_Week Localtime Add_Delta_Days Mktime );

my ( $fold, $collect ) = gather_mtime_between( weekday_to_epoch_range(1, 1) );
find $fold, '.';

for my $file ( &$collect ) {
  my $when = localtime( (stat $file)[9] );
  print "$when: $file\n";
}

sub weekday_to_epoch_range {
  my ( $wd, $days ) = @_;

  my @today = ( Localtime() )[0..2];
  my @target = Add_Delta_Days( @today, $wd - Day_of_Week( @today ) );

  return ( Mktime( @target, (0) x 3 ),
           Mktime( Add_Delta_Days( @target, $days ), (0) x 3 ) );
}

sub gather_mtime_between {
  my ( $s, $e ) = @_;

  my @fn;
  my %finder = (
    fold => sub {
        my $t = (stat)[9];
        push @fn, $File::Find::name if $t >= $s && $t < $e;
      },
    collect => sub { wantarray ? @fn : \@fn },
  );

  wantarray ? @finder{'fold','collect'} : \%finder;
}
