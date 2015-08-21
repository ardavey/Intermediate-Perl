#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More tests => 8;
use My::List::Util;

  my @list=(1,2,3,4);

  my @new_list=My::List::Util::shuffle(@list);
  
  foreach my $value ( @list ){
    ok(grep{$_ eq $value} @new_list, "$value is in new list");
  }
  
  foreach my $value ( @new_list ){
    ok(grep{$_ eq $value} @list, "$value is in old list");
  }
