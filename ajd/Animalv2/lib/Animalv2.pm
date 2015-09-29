package Animalv2;

use 5.006;
use strict;
use warnings;

use Moose::Role;
use namespace::autoclean;

requires 'default_colour';

=head1 NAME

Animalv2 - Mooselike animals

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Animalv2;

    my $foo = Animalv2->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 name

Get or set the animal's name

=cut

has 'name' => (
    is => 'rw',
    isa => 'Str',
    default => sub { 'a nameless ' . lc( ref( shift ) ) },
  );

=head2 colour

Get the animal colour.

=head2 dye

Well how else would you change an animal's colour?

=cut

has 'colour' => (
    is => 'ro',
    default => sub { shift->default_colour() },
    writer => 'dye',
  );

=head2 sound

Sound made by an Animal, must be overridden in child classes

=cut

has 'sound' => (
    is => 'ro',
    default => sub { confess ref( shift ), ' needs to define sound' },
);

=head2 speak

Causes Animals to utter sounds

=cut

sub speak {
  my $self = shift;
  print $self->name() . " says " . $self->sound() . "\n";
}

=head2 admire

Admire your animal from afar

=cut

sub admire {
  my $self = shift;
  print $self->name() . " is a " . $self->colour() . " " . ref( $self ) . "\n";
}

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

=head1 SUPPORT

You're on your own.

=head1 LICENSE AND COPYRIGHT

Steal this and I'll cut you

=cut

1; # End of Animalv2
