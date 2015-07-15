#!/usr/bin/perl
use utf8;
use strict;
use warnings;

use v5.12;

my %patterns = (
  Gilligan   => qr/(?:Wiley )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
);

my $rm = rightmost( 
  'There is Mrs. Howell, Ginger, and Gilligan',
  \%patterns
);

say "Rightmost match is '$rm'";


sub rightmost {
  my( $string, $patterns ) = @_;
  
  my $rightmost = -1;
  my $last_matched_pattern;
  while( my( $name, $pattern ) = each %$patterns ) {
    my $position = $string =~ m/$pattern/ ? $-[0] : -1;
    if ( $position > $rightmost ) {
      $rightmost = $position;
      $last_matched_pattern = $name;
    }
  }

  return $last_matched_pattern;
}
