package Sheep;

use 5.006;
use strict;
use warnings;

use Moose;
with 'Animalv2';

=head1 NAME

Sheep - A more mooselike Sheep

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Make a sheep, it's a bit like the last one except less work for me.

    use Sheep;

    my $foo = Sheep->new();
    ...

=head1 SUBROUTINES/METHODS

For inherited ones see Animal

=head2 sound

Makes a sheep sound

=cut

has 'sound' => ( is => 'ro', default => 'baaaa' );

=head2 default_colour

Default sheep colour

=cut

# Couldn't get this working as a moosey attribute
sub default_colour { 'white' }

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

=cut

__PACKAGE__->meta->make_immutable();

1; # End of Sheep
