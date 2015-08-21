use Test::More;

BEGIN {
  use_ok( 'Cow' );
  diag( "Testing Cow $Cow::VERSION, Perl $], $^X" );
}

is( Cow->sound, 'moooo', 'Cows go moo, as it was foretold' );
ok( Cow->speak, 'Cows speak' );

&done_testing;
