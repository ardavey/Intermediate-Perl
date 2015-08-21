use strict;
use warnings;

use Test::More;

BEGIN {
  use_ok( 'Animal' ) || print "Bail out!\n";
}

diag( "Testing Animal $Animal::VERSION, Perl $], $^X" );

# they have to be defined in Animal.pm
ok( defined &Animal::speaks_english, 'Animal::speaks_english is defined' );

{
# check that sound() dies
eval { Animal->sound() } or my $at = $@;
like( $at, qr/You have/, 'sound() dies with a message' );
}

{
# check that speak() dies too
eval { Animal->speak() } or my $at = $@;
like( $at, qr/You have/, 'speak() dies with a message' );
}

{
# check that speaks_english returns 0
is( Animal->speaks_english(), 0, 'speaks_english returns 0' );
}

#{
#  package Foofle;
#  use base qw(Animal);
#  sub sound { 'foof' }
#
#  my $mock = 'Foofle';
#  is(
#    $mock->speak,
#    "A Foofle goes foof!\n",
#    'An Animal subclass does the right thing'
#  );
#}

done_testing();
