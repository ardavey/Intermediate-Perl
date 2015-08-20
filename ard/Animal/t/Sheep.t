use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
  use_ok( 'Sheep' ) || BAIL_OUT();
}

ok( defined &Sheep::sound, 'Sheep::sound is defined' );

{
  # check that sound() returns the expected sound
  is( Sheep->sound(), 'baaaah', 'The sheep baaaahs!' );
}
