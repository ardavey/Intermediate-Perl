use strict;
use warnings;

use Test::More tests => 1;

BEGIN{
  use_ok( 'List::Util' ) || BAIL_OUT();
  require_ok ( 'List::Util' ) || BAIL_OUT();
}

diag( "Testing List::Util $My::VERSION, Perl $], $^X" );
