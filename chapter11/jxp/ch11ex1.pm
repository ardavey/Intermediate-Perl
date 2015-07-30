package Ch11ex1;
use strict;
use warnings;

our @day = qw(ark dip wap sen pop sep kir);
our @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub number_to_day_name { 
  my $num = shift @_; 
  return $day[$num];
}
sub number_to_month_name { 
  my $num = shift @_; 
  return $month[$num]; 
}


