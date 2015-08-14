#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 7;

BEGIN {
    use_ok( 'Animal' ) || print "Bail out!\n";
    use_ok( 'Cow' ) || print "Bail out!\n";
    use_ok( 'Horse' ) || print "Bail out!\n";
    use_ok( 'LivingCreature' ) || print "Bail out!\n";
    use_ok( 'Mouse' ) || print "Bail out!\n";
    use_ok( 'Person' ) || print "Bail out!\n";
    use_ok( 'Sheep' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );
