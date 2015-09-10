#!/usr/bin/perl
use strict;
use warnings;

use Oogaboogoo::Date qw( :all );
use Time::Piece;

# you can't make me use localtime!
my $t = new Time::Piece;

printf( "Today is %s %s %s %s\n", day_name( $t->wday ), month_name( $t->mon ), $t->mday, $t->year );
