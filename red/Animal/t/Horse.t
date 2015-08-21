use Test::More;

BEGIN {
  use_ok( 'Horse' );
  diag( "Testing Horse $Horse::VERSION, Perl $], $^X" );
}

is( Horse->sound, 'neigh', 'Do horses speak human? Neigh' );
ok( Horse->speak, 'Horses speak' );

&done_testing;
