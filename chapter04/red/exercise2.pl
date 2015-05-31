#!/usr/bin/perl
use strict;
use warnings;

my @skipper   = qw( blue_shirt hat jacket preserver sunscreen );
my @professor = qw( sunscreen water_bottle slide_rule batteries radio );
my @gilligan  = qw( red_shirt hat lucky_socks water_bottle );

my %all = (
  Gilligan  => \@gilligan, 
  Skipper   => \@skipper, 
  Professor => \@professor,
  );

check_items_for_all( \%all );

sub check_items_for_all {
  my ( $crew_items ) = @_;
  
  while ( my ( $crew_member, $items ) = each %$crew_items ) {
    check_required_items( $crew_member, $items );
  }
}

sub check_required_items {
  my ( $who, $items ) = @_;

  my %whose_items = map { $_, 1 } @$items;
  my @required = qw( preserver sunscreen water_bottle jacket );
  my @missing;

  for my $item ( @required ) {
    if ( !$whose_items{$item} ) {
      print "$who is missing $item.\n";
      push @missing, $item;
    }
  }

  if ( @missing ) {
    print "Adding @missing to @$items for $who.\n";
    push @$items, @missing;
  }
}
