package Date::Oogaboogoo;

=head1 NAME

Date::Oogaboogoo

=head1 VERSION

Version 1.0

=head1 SYNOPSIS

  use Date::Oogaboogo;

  my $day = Date::Oogaboogoo::number_to_day_name(1); # dip
  my $mon = Date::Oogaboogoo::number_to_month_name(3); # rod

=head1 DESCRIPTION

A date formatting library for display of dates in the Oogaboogoo calendar.

=cut

use strict;
use warnings;
require Exporter;
use vars qw( @ISA @EXPORT_OK );

@ISA = 'Exporter';
@EXPORT_OK = qw(
  number_to_day_name
  number_to_month_name
  );

my @days = qw( ark dip wap sen pop sep kir );
my @months = qw( diz pod bod rod sip wax lin sen kun fiz nap dep );

=head2 FUNCTIONS

=over

=item C<number_to_day_name( $ndx )>

Looks up the day of the week by index (0-6) returning the Oogaboogoo name for the day.

=back

=cut

sub number_to_day_name {
  my ( $i ) = @_;

  if ( $i < 0 || $i > $#days ) {
    die sprintf 'Index [%d] out of bounds, there are only %d days in the Oogaboogoo week', $i, scalar @days;
  }

  return $days[$i];
}

=over

=item C<number_to_month_name( $ndx )>

Looks up the month by index (0-11) returning the Oogaboogoo name for the month.

=back

=cut

sub number_to_month_name {
  my ( $i ) = @_;

  if ( $i < 0 || $i > $#months ) {
    die sprintf 'Index [%d] out of bounds, there are only %d months in the Oogaboogoo calendar', $i, scalar @months;
  }

  return $months[$i];
}

1
