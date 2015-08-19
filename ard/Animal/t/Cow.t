use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
  use_ok( 'Cow' ) || BAIL_OUT();
}

diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

ok( defined &Cow::sound, 'Cow::sound is defined' );

{
  # check that sound() returns the expected sound
  is( Cow->sound(), 'moooo', 'The cow moos!' );
}
