package Stereotypes;

use strict;
require Exporter;

use Exporter qw( import );

our @EXPORT_OK = qw( dow_to_name moy_to_name );
our %EXPORT_TAGS = ( 
  all => [ @EXPORT_OK ],
  );

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

