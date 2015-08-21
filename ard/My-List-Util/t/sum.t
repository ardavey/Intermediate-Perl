use strict;
use warnings;

use Test::More tests => 8;

BEGIN {
  use_ok( 'My::List::Util' ) || BAIL_OUT();
}

ok( defined &My::List::Util::sum, 'sum() is defined' );

# Valid integers
is( My::List::Util::sum( 1, 2, 3 ), 6, '1 + 2 + 3 = 6' );

# Valid decimals
is( My::List::Util::sum( 1.1, 2.34, 3.56, -4.32 ), 2.68, 'Decimals can be summed too' );

# Huge numbers
is( My::List::Util::sum( qw( 1234567890123456789012345678901234567890 1234567890123456789012345678901234567890 1234567890123456789012345678901234567890 ) ), 3703703670370370367037037036703703703670, 'Huuuuuuuuuuge' );

# Strings
is( My::List::Util::sum( qw( 1 2 3 ) ), 6, '"1" + "2" + "3" = 6' );

# Non-numerics
is( My::List::Util::sum( qw( one two ) ), undef, 'All non-numerics gives undef' );

# Mixed numeric/non-numeric
is( My::List::Util::sum( qw( one two 3 4 ) ), 7, 'Mixed numeric/non-numerics - only numbers are counted' );
