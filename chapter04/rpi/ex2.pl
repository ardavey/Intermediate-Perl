#!/usr/bin/perl

use strict;
use warnings;

sub check_items_for_all {
  my ( $all ) = @_;

  foreach $name ( keys %$all ) {
    check_required_items( $name, $all->{name} );
  }
}
