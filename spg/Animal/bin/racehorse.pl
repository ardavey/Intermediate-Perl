#! /usr/bin/perl

use strict;
use warnings;
use RaceHorse;

{
my $runner = RaceHorse->new('Billy Boy','blue');
$runner->won;
print $runner->name, ' has standings ', $runner->standings, ".\n";
}
