package OogaboogooCalendar;

use strict;
use warnings;

use Exporter qw(import);

our @EXPORT_OK = qw(
    number_to_day
    number_to_month
);

use Data::Dumper;

use constant {
    DAY => [ qw( ark dip wap sen pop sep kir ) ],
    MONTH => [ qw( diz pod bod rod sip wax lin sen kun fiz nap dep ) ],
};

sub number_to_day {
    my $num = shift;
    if ($num > 6 || $num < 0 ){
        die "Number provided not in range of days (0 - 6)";
    }
    return DAY->[$num];
}

sub number_to_month {
    my $num = shift;
    if ($num > 11 || $num < 0 ){
        die "Number provided not in range of months (0 - 11)";
    }
    return MONTH->[$num];
}


'blarg';