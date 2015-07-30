package Oogaboogoo::Date;

use strict;
use warnings;

my @days = qw( ark dip wap sen pop sep kir );
my @months = qw( diz pod bod rod sip wax lin sen kun fiz nap dep );

use parent qw( Exporter );
our @EXPORT_OK = qw(
  day_name
  month_name
);

# Takes a numeric representation of the day of the week (1-indexed) and
# returns the name of that day.
sub day_name {
  my ( $num ) = @_;
  return _get_indexed_value( \@days, $num, 'day' );
}

# Takes a numeric representation of the month of the year (1-indexed) and
# returns the name of that month.
sub month_name {
  my ( $num ) = @_;
  return _get_indexed_value( \@months, $num, 'month' );
}

sub _get_indexed_value {
  my ( $arr, $idx, $label ) = @_;
  $label //= 'value';
  my $max = scalar @$arr;
  if ( $idx < 1 || $idx > $max ) {
    die "$label '$idx' outside allowed range 1-$max";
  }
  return $arr->[$idx - 1];
}

1;
