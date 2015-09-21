#!/usr/bin/perl

use strict;
use warnings;
use v5.14.2;

use Cow;
use Horse;
use Sheep;
use Mouse;

my @animals = qw ( Cow Horse Sheep Mouse );

# Ask the user which animals should speak
print "What do you want in your Barnyard? One animal per line, Ctrl-D to end:\n";
chomp( my @barnyard = <> );
@barnyard = grep { $_ ~~ @animals } map { ucfirst ( lc ( $_ ) ) } @barnyard;

foreach ( @barnyard ) {
  $_->new->speak();
}

