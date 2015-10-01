#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;
use Test::File;

plan tests => 2;

diag( "Testing your hosts file, Perl $], $^X" );

SKIP: {
  if ( $^O ne 'linux' ) {
    skip ( 'This is not linux', 1 );
  }

  file_exists_ok( '/etc/hosts/' );

}

SKIP: {
  if ( $^O ne 'windows' ) {
    skip ( 'This is not windows', 1 );
  }

  file_exists_ok( 'C:\windows\system32\drivers\etc\hosts' );

}
