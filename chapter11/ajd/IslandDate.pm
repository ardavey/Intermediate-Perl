package IslandDate;

=head1 NAME

IslandDate

=head1 SYNOPSIS

  require 'IslandDate.pm';

  my $island_day = IslandDate::number_to_day_name( 1 );

=head1 DESCRIPTION

A package to convert dates from localtime to Island format.

=cut

use strict;
use warnings;

my @days = qw( ark dip wap sen pop sep kir );
my @months = qw( diz pod bod rod sip wax lin sen kin fiz nap );

=head2 FUNCTIONS

=over

=item C<number_to_day_name>

Takes one argument, returns a day of the week. 0 is Sunday.

=back

=cut

sub number_to_day_name {
  my ( $number ) = @_;

  # Looks like the week starts on Sunday
  if ( ( $number < 0 ) || ( $number > 6 ) ) {
    die ( "'$number' is out of Day range\n" );
  }

  return $days[ $number ];
}

=over

=item C<number_to_month_name>

Takes one argument, returns a month of the year, 1 is January.

=back

=cut

sub number_to_month_name {
  my ( $number ) = @_;

  if ( ( $number < 1 ) || ( $number > 12 ) ) {
    die ( "'$number' is out of Month range\n" );
  }

  return $months[ $number ];

}

1;

