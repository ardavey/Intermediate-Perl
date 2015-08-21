use strict;
use warnings;

use Test::More tests => 5;

BEGIN {
  use_ok( 'My::List::Util' ) || BAIL_OUT();
}

ok( defined &My::List::Util::shuffle, 'shuffle() is defined' );

# Happy shuffling
{
  my @array = qw( a b c d e f g );
  my @shuffled = My::List::Util::shuffle( @array );
  is( scalar @array, scalar @shuffled, 'Shuffled list is the same size' );
  isnt( "@array", "@shuffled", 'Shuffled array is different' );
}

# No args - empty list
{
  my @shuffled = My::List::Util::shuffle();
  is( scalar @shuffled, 0, 'Empty in, empty out' );
}
