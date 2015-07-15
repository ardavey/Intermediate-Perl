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

my $key = rightmost( 'There is Mrs. Howell, Ginger, and Gilligan', \%patterns );

print "Rightmost mathcing key: $key\n";

sub rightmost {
    my ( $string, $patterns ) = @_;

    my $rightmost = -1;
    my $rightmost_key = 'Unmatched!';
    foreach my $key ( keys %$patterns ) {
        my $position = $string =~ m/$patterns->{$key}/ ? $-[0] : -1;
        if ( $position > $rightmost ) {
            $rightmost     = $position;
            $rightmost_key = $key;
        }
    }

    return $rightmost_key;
}
