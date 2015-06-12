#!/usr/bin/perl

use strict;
use warnings;

# The problem is that the code is assigning an anonymous hashref to
# a hash. It should be:

my %hash = (
  # some stuff
);

# Or

my $hashref = {
  # some stuff
};

