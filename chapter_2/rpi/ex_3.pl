#!/use/bin/perl

use strict;
use warnings;

use Business::ISBN qw( group_code publisher_code );

my $book = Business::ISBN->new( '9781449393090' );

#print group_code( '' );
print $book->group_code() . "\n";;
