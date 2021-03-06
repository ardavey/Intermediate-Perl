use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
  use_ok( 'Horse' ) || BAIL_OUT();
}

ok( defined &Horse::sound, 'Horse::sound is defined' );

{
  # check that sound() returns the expected sound
  is( Horse->sound(), 'neigh', 'The horse neighs!' );
}
