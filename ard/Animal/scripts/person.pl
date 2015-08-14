#!/usr/bin/perl
use strict;
use warnings;

use lib '../lib';

use Person;
use Cow;
use Mouse;
use Sheep;
use Horse;

foreach ( qw( Person Cow Mouse Sheep Horse ) ) {
  $_->speak;
  $_->speak( "Hello there, I am a $_" );
}
