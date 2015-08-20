use strict;
use warnings;

use Test::More tests => 14;

BEGIN {
  require_ok( 'My::List::Util' ) || print "Bail out!\n";
}

diag( "Testing My::List::Util::shuffle' $My::List::Util::VERSION, Perl $], $^X" );
ok( defined &My::List::Util::shuffle, 'My::List::Util::shuffle is defined' );

my @in = ( 1..10 );
my @out = My::List::Util::shuffle( @in );
# and you shake it all about

is( scalar @in, scalar @out, 'input and output are same length' );

for my $i ( @in ) {
  ok( $i ~~ @out, "$i is included in \@out" );
}

isnt( "@in", "@out", 'test input and output are different' ); # intermittent fail - has a 1/3628800 chance of failing
