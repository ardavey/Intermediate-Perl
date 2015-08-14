#!/usr/bin/perl -Ilib
use 5.014;
use warnings;
use strict;

use Animal;
use Cow;
use Horse;
use Mouse;
use Sheep;

while ( <> ) {
  chomp;
  last if $_ eq '';
  my ( $class ) = ucfirst =~ /^(cow|horse|mouse|sheep)$/i or next;
  $class->speak;
}
