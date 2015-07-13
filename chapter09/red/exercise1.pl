#!/usr/bin/perl
use strict;
use warnings;

my %patterns = (
  Gilligan   => qr/(?:Wiley )?Gilligan/,
  'Mary-Ann' => qr/Mary-Ann/,
  Ginger     => qr/Ginger/,
  Professor  => qr/(?:The )?Professor/,
  Skipper    => qr/Skipper/,
  'A Howell' => qr/Mrs?. Howell/,
  );

my $key = rightmost(
  'There is Mrs. Howell, Ginger, and Gilligan',
  \%patterns
  );

print "The rightmost passenger is $key\n";

sub rightmost {
  my( $string, $patterns ) = @_;

  my ( $rightmost, $key ) = -1, undef;
  while( my( $passenger, $pattern ) = each %$patterns ) {
    my $position = $string =~ m/$pattern/ ? $-[0] : -1;

    if ( $position > $rightmost ) {
      ( $rightmost, $key ) = ( $position, $passenger );
    }
  }

  return $key;
}

