use Test::More;

BEGIN {
  use_ok( 'My::List::Util' );
  My::List::Util->import( qw( reduce ) );
}

is ( ( reduce { $a + $b } 5 ), 5, 'Reduce with a single value' );
is ( ( reduce { $a + $b } 0, 5, 3 ), 8, 'Reduce for summing' );
is ( ( reduce { $a . $b } 'Hello', ', ', 'World', '!' ), 'Hello, World!',
  'Reduce for string concatenation' );

is ( ( reduce { $a . ', ' . $b } 1, 2, 3 ), '1, 2, 3',
  'Reduce for joining strings with a delimiter' );

my %x = ( foo => 'Foo!', bar => 'Bar!' );
my %y = ( zebra => 'Zebra!', platypus => 'Wha!?' );

is_deeply(
  ( reduce { @$a{keys $b} = values $b; $a } {}, \%x, \%y ),
  { foo => 'Foo!', bar => 'Bar!', zebra => 'Zebra!', platypus => 'Wha!?' },
  'Reduce for merging datastructures' );

&done_testing;
