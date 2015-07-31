package Stereotypes;

use strict;
require Exporter;

use vars qw( @ISA @EXPORT_OK );

@ISA = qw( Exporter );
@EXPORT_OK = qw( dow_to_name moy_to_name );

my @days = qw(ark dip wap sen pop sep kir);
my @months = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub dow_to_name {
  my ( $dow ) = @_;

  return $days[$dow] // "INVALID DAY";
}

sub moy_to_name {
  my ( $moy ) = @_;

  return $months[$moy] // "INVALID MONTH";
}

