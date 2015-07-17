#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.10;

my %patterns = ( Gilligan => qr/(?:Wiley )?Gilligan/,
                 'Mary-Ann' => qr/Mary-Ann/,
                 Ginger => qr/Ginger/,
                 Professor => qr/(?:The )?Professor/,
                 Skipper => qr/Skipper/,
                 'A Howell' => qr/Mrs?\. Howell/, # Escaped. Mrsa Howell probably shouldnt be a valid match
                 );

say rightmost( 'There is Mrs. Howell, Ginger, and Gilligan', \%patterns );

sub rightmost {
  my ( $string, $patterns ) = @_;
  my $result = undef;
  while ( my ( $key, $pattern ) = each %$patterns ) {
    state $rightpos = -1;
    my $position = $string =~ m/$pattern/ ? $-[0] : -1;
    if ( $position > $rightpos ) {
      $rightpos = $position;
      $result = $key;
    }
  }

  return $result // 'No matches!';
}
