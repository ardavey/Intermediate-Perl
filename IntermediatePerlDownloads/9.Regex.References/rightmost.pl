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

rightmost( 
  'There is Mrs. Howell, Ginger, and Gilligan',
  @patterns{ sort keys %patterns }
);	
	
sub rightmost {
  my( $string, @patterns ) = @_;
  
  my $rightmost = -1;
  while( my( $i, $pattern ) = each @patterns ) {
	my $position = $string =~ m/$pattern/ ? $-[0] : -1;
	$rightmost = $position if $position > $rightmost;
	}

return $rightmost; 		
}
