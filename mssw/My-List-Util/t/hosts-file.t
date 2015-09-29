package Blarg::Honk;

use strict;
use warnings;

use Test::More;
use Test::File;

diag("Testing Hosts file presence, $^X");

SKIP: {
    if ( $^O !~ /windows/i ){
       skip "Not a Windows OS", 1;
    }
    
   file_exists_ok( 'C:\windows\system32\drivers\etc\hosts' );
}

SKIP: {
    if( $^O !~ /linux/i ){
        skip "Not a Linux OS", 1;
    }
    
    file_exists_ok( '/etc/hosts/' );
}


done_testing();