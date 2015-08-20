use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
  use_ok( 'Cow' ) || print "Bail out!\n";
}

diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );

# they have to be defined in Cow.pm
ok( defined &Cow::sound, 'Cow::sound is defined' );

is( Cow->sound(), 'moooo', 'sound() is correct' );
