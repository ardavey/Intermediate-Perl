package Animal;

use base qw( LivingCreature );

use strict;
use warnings;

use Carp qw( croak );

=head1 NAME

Animal - The great new Animal!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

This module allows you to make named animals in different colours, the default colour is brown.

Here is an example of an animal:

    use Animal;

    my $foo = Animal->named( 'bob' );

    $foo->set_colour( 'blue' );
    ...

=head1 SUBROUTINES/METHODS

=head2 named

Create an animal with a name

=cut

sub named {
  my ( $class, $name ) = @_;

  my $self = ( name => $name, colour => _default_colour() );

  bless $self, $class;
}

=head2 _default_colour

Returns the default colour of an animal

=cut

sub _default_colour {
  return 'brown';
}

=head2 set_colour

Method to set the colour of a named animal

=cut

sub set_colour {
  my $self = shift;

  croak 'This is not a named animal' unless ref $self;

  my $self->{colour} = shift;
}

=head2 colour

Get the colour of an animal

=cut

sub colour {
  my $either = shift;

  ref $either ?
    $either->{colour}
    :
    _default_colour();
}

=head2 set_name

Set the name of a named animal

=cut

sub set_name {
  my $self = shift;

  croak 'This is not a named animal' unless ref $self;

  my $self->{name} = shift;
}

=head2 name

Get name of animal

=cut

sub name {
  $either = shift

  ref $either ?
    $either->{name}
    :
    "Unnamed $either";
}

=head2 speaks_english

Does this living creature speak English?

=cut

sub speaks_english {
  return 0;
}

=head1 AUTHOR

dickyince, C<< <minnimince at googlemail.com> >>

=cut

1; # End of Animal
