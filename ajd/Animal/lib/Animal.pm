package Animal;

use 5.006;
use strict;
use warnings;

use parent qw( LivingCreature );

=head1 NAME

Animal - The great new Animal!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Intended to be an abstract class for other animals

=head1 SUBROUTINES/METHODS

=head2 new

Creates a new animal. Can only be called by sub-classes of Animal.

=cut

sub new {

  my ( $class, $name, $colour ) = @_;

  if ( $class eq 'Animal' ) {
    die ( "Cannot create an instance of 'Animal', new method can only be called on sub-classes\n" ) ;
  }

  my $data = {
    name => $name // "a nameless $class",
    colour => $colour // $class->default_colour(),
  };

  return bless( $data, $class );

}

=head2 speak

Will cause an animal to make noise, provided their sound()
method has been implemented

=cut

sub speak {

  my $class = shift;
  $class->SUPER::speak( $class->sound );
}

=head2 sound

The noise made by an animal. This must be overidden.

=cut

sub sound {
  die 'You must define sound() in a subclass';
}

=head2 default_colour

The default colour of an animal. This must be overidden.

=cut

sub default_colour {
  die 'You must define default_colour() in a subclass';
}

=head2 name

Call with a name to set the name. Call with no params to get the name.

=cut

sub name {

  my $self = shift;

  if ( ref( $self ) ) {
    if ( scalar( @_ ) ) {
      $self->{name} = shift;
    } else {
      return $self->{name};
    }
  } else {
    if ( scalar( @_ ) ) {
      die "Attempted to set the name of all ${self}s everywhere\n";
    }
    else {
      return "an nameless $self";
    }
  }

}

=head2 colour

Call with a colour to set the colour Call with no params to get the colour

=cut

sub colour {

  my $self = shift;

  if ( ref( $self ) ) {
    if ( scalar( @_ ) ) {
      $self->{colour} = shift;
    } else {
      return $self->{colour};
    }
  } else {
    if ( scalar( @_ ) ) {
      die "Attempted to set the colour of all ${self}s everywhere\n";
    }
    else {
      return $self->default_colour();
    }
  }

}

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

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

Copyright 2015 Alex Deas.

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
