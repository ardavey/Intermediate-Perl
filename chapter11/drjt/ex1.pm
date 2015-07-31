#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

package ex1;

use constant { DAY_NAMES => [qw( ark dip wap sen pop sep kir )],
               MONTH_NAMES => [qw( diz pod bod rod sip wax lin sen kun fiz nap dep )],
               };


sub number_to_day_name {
  my $num = shift;
  return number_to_name( $num, "'$num' is not a valid day number!\n", DAY_NAMES );
}

sub number_to_month_name {
  my $num = shift or die;
  return number_to_name( $num, "'$num' is not a valid month number!\n", MONTH_NAMES );
}

sub number_to_name {
  my ( $num, $ondie, $list ) = @_;
  foreach my $int ( 1 .. $#$list ) { # there are far better ways of doing this (such as just returning a '.. or die', but I kinda like the $#$
    if ( $num == $int ) {
      return $list->[$num];
    }
  }
  die $ondie;
}

1;
