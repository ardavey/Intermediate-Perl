use Test::More;

BEGIN {
  use_ok( 'My::List::Util' );
  My::List::Util->import( qw( shuffle ) );
}

is( scalar shuffle(), 0, 'Empty list returned when empty list passed');
is_deeply( [ shuffle( 12 ) ], [ 12 ],
  'Shuffle of single element results in same element' );

# Odd to sort a shuffled array, but this ensures we don't add
# or remove elements in the process.
is_deeply(
  [ sort { $a <=> $b } shuffle( 12, 23, 54, 22, 33, 3 ) ],
  [qw( 3 12 22 23 33 54 )],
  'Output array contains the same values as passed in' );

# Not a whole lot more that can be tested really.
my @list = qw( 1 2 3 4 5 );
note ( sprintf "Given the list [%s], shuffle has output: [%s]",
  (join ', ', @list),
  (join ', ', shuffle(@list) ));

&done_testing;
