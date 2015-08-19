use Test::More;

BEGIN {
  use_ok( 'Sheep' );
  diag( "Testing Sheep $Sheep::VERSION, Perl $], $^X" );
}

is( Sheep->sound, 'baaaah',
  'Sheep baa. Well, they bleat incessently but close enough' );
ok( Sheep->speak, 'Sheep speak' );

&done_testing;
