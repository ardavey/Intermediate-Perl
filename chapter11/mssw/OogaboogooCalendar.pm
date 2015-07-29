package Oogaboogoo;

use strict;
use warnings;

use Data::Dumper;

use constant {
    DAY => [ qw( ark dip wap sen pop sep kir ) ],
    MONTTH => [ qw( diz pod bod rod sip wax lin sen kun fiz nap dep ) ],
}

sub number_to_day {
    my $num = shift;
    if ($num > 6 || $num < 0 ){
        die "Number provided not in range of days (0 - 6)";
    }
    return DAY->[$num];
}

sub number_to_month {
    $num = shift;
    if ($num > 11 || $num < 0 ){
        die "Number provided not in range of months (0 - 11)";
    }
    return MONTH->[$sum];
}


