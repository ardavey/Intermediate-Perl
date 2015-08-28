package Animal;

use 5.006;
use strict;
use warnings;

use Carp qw(croak);

=head1 NAME

Animal - The great new Animal!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

use parent qw(LivingCreature);

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Animal;

    my $foo = Animal->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 new

=cut

sub new {
  my ( $class, $name, $colour ) = @_;

  $colour = default_colour() unless defined $colour;

  return bless { name => $name, colour => $colour }, $class;

}

=head2 set_name

=cut

sub set_name {
  ref $_[0] or croak "Cannot set name of generic thing";
  $_[0]->{name} = $_[1];
  return $_[0];
}

=head2 name

=cut

sub name {
  return ref $_[0] ? $_[0]->{name} : "An unamed $_[0]";
}

=head2 set_colour

=cut

sub set_colour {
  ref $_[0] or croak "Cannot set colour of generic thing";
  $_[0]->{colour} = $_[1];
  return $_[0];
}

=head2 colour

=cut

sub colour {
  return ref $_[0] ? $_[0]->{colour} : $_[0]->default_colour();
}

=head2 default_colour

=cut

sub default_colour { 'brown' };

=head2 speak

=cut

sub speak {
  my ( $self ) = @_;

  printf "%s says \"%s\"!\n", $self->get_type(), $self->get_voice();
}

=head2 get_type

=cut

sub get_type {
  return "Unknown beast, shrouded in darkness,";
}

=head2 get_voice

=cut

sub get_voice {
  return "welcome to the jungle";
}

=head1 AUTHOR

spg, C<< <simon.gross at datacash.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-animal at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Animal>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Animal


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Animal>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Animal>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Animal>

=item * Search CPAN

L<http://search.cpan.org/dist/Animal/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2015 spg.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Animal
