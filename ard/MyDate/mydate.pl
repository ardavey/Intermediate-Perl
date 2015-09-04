#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use MyDate;

use Time::Piece;

my $d = new MyDate;

sub UNIVERSAL::debug {
  my ( $self, $msg ) = @_;
  my $t = localtime;
  print "$t: $msg\n";
}

foreach my $thing ( qw( date month year ) ) {
  say "$thing: " . $d->$thing();
}

# This isn't picked up by AUTOLOAD because UNIVERSAL is checked first
$d->debug( "Time to go to bed!" );

say "blarg: " . $d->blarg();

