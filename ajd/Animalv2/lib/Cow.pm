package Cow;

use 5.006;
use strict;
use warnings;

use Moose;
with 'Animalv2';

=head1 NAME

Cow - A more mooselike Cow

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Make a cow, it's a bit like the last one except less work for me.

    use Cow;

    my $foo = Cow->new();
    ...

=head1 SUBROUTINES/METHODS

For inherited ones see Animal

=head2 sound

Makes a cow sound

=cut

has 'sound' => ( is => 'ro', default => 'moo' );

=head2 default_colour

Default cow colour

=cut

# Couldn't get this working as a moosey attribute
sub default_colour { 'brown' }

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

=cut

__PACKAGE__->meta->make_immutable();

1; # End of Cow
