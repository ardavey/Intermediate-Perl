#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 7;

BEGIN {
    foreach my $class ( qw( Animal Cow Horse LivingCreature Mouse Person Sheep )){
        use_ok( $class ) || print "Bail out!\n";
    }
}

diag("Testing Animal $Animal::VERSION, Perl $], $^X");
