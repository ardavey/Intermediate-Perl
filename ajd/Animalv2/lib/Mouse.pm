package Mouse;

use 5.006;
use strict;
use warnings;

use Moose;
with 'Animalv2';

=head1 NAME

Mouse - A more mooselike Mouse

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Make a mouse, it's a bit like the last one except less work for me.

    use Mouse;

    my $foo = Mouse->new();
    ...

=head1 SUBROUTINES/METHODS

For inherited ones see Animal

=head2 sound

Makes a mouse sound

=cut

has 'sound' => ( is => 'ro', default => 'squeak' );

after 'speak' => sub {
  print "[but you can barely hear it!]\n";
};

=head2 default_colour

Default mouse colour

=cut

# Couldn't get this working as a moosey attribute
sub default_colour { 'brown' }

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

=cut

__PACKAGE__->meta->make_immutable();

1; # End of Mouse
