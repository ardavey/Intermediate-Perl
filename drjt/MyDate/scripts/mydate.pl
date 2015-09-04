#!/usr/bin/perl
use 5.010;
use warnings;
use strict;

use File::Basename qw( basename );

use MyDate;

say "Date is ", MyDate::date();
say "Month is ", MyDate::month();
say "Year is ", MyDate::year();

MyDate->debug( "Moo" );

sub UNIVERSAL::debug {
  shift;
  printf( "%s: %s\n", MyDate::date(), join( ' ', @_ ) );
}
