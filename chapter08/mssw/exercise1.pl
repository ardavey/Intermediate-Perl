#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use IO::Tee;

use constant {

    DAY => [qw( Sun Mon Tue Wed Thu Fri Sat )],
    MON => [qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec )],
};

if ( !scalar @ARGV ) {
    print "Please provide a desination or use STRING for an internal string\n";
    exit 1;
}
my $string;
my @fh_refs;
foreach my $arg (@ARGV) {
    print "arg is $arg\n";
    my $fh;
    if ( $arg eq "STRING" ) {
        open $fh, '>:encoding(UTF-8)', \$string;
    }
    else {
        open $fh, '>:encoding(UTF-8)', $arg;
    }
    push @fh_refs, $fh;
}

my $time = localtime;
my ( $day, $mon, $year, $wday ) = (localtime)[ 3 .. 6 ];

my $tee_fh = new IO::Tee(@fh_refs);
print $tee_fh
  sprintf( "%s %u-%s-%u", DAY->[$wday], $day, MON->[$mon], $year + 1900 );
if ($string) {
    print "String variable: [$string]\n";
}
