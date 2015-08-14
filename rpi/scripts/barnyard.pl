#!/usr/bin/perl

use strict;
use warnings;

use Cow;
use Horse;
use Sheep;
use Mouse;

my @animals = ();

sub add_cow {
  push @animals 'Cow';
}

sub add_horse {
  push @animals 'Horse';
}

sub add_mouse {
  push @animals 'Mouse';
}

sub add_sheep {
  push @animals 'Sheep';
}

sub create_barnyard {
  print "There are $#animals in the barnyard and they go:\n";
  for my $animal ( @animals ) {
    $animal->speak();
  }
}


