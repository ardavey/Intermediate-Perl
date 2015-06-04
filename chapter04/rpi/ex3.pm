#!/usr/bin/perl

use strict;
use warnings;

$all = {
  Gilligan => { items => qw( all the stuff), location => 'The Island' },
  Skipper => { items => qw( all the stuff), location => 'The Island' },
  'Mr. Howell' => { items => qw( all the stuff), location => 'The Island' },
  'Mrs. Howell' => { items => qw( all the stuff), location => 'The Island' },
};

sub check_items_for_all {
  my ( $all ) = @_;

  foreach $name ( keys %$all ) {
    check_required_items( $name, $all->{name}->{items} );
  
    if ( $name =~ /Howell/ ) {
      $all->{name}->{location} = 'The Island Country Club';
    }
  }

  foreach $name ( keys %$all ) {
    print "$name is as $all->{name}->{location}\n";
  }
}

1;
