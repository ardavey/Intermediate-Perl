#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 1;
use My::List::Util;

  my @list=(1,2,3,4);

  my $total=My::List::Util::sum(@list);

  is($total, 10,"Sum works");

  my @bad_list=(1,2,'hello',4);

  my $bad_total=My::List::Util::sum(@bad_list);

  is($bad_total, 7,"Sum works ignoring non numeric values");
