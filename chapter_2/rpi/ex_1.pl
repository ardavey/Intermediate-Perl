#!/use/bin/perl

use strict;
use warnings;

use Cwd qw( cwd realpath );

opendir( DIR, cwd() ) or die $!;

while( my $file = readdir( DIR ) ) {
  printf( "    %s\n", realpath( $file ) ) unless ( $file =~ /^\.{1,2}$/ );
}

closedir( DIR );
