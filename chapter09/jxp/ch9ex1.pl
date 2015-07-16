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

print rightmost( 
  'There is Mrs. Howell, Ginger, and Gilligan',
  \%patterns
);	
	
sub rightmost {
  my( $string, $patterns ) = @_;
  
  my $rightmost = -1;
  my $rightmost_name = "";
  while( my( $name, $pattern ) = each %$patterns ) {
    my $position = $string =~ m/$pattern/ ? $-[0] : -1;
    if ( $position > $rightmost ){
      $rightmost = $position;
	  $rightmost_name = $name;
    }
  }

return $rightmost_name; 		
}
