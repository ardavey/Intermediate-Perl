package RaceHorse;

use v5.16;
use Moose;
use Carp;
use namespace::autoclean;

extends 'Horse';

=head1 NAME

RaceHorse - an accurate depiction of a race Horse.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
dbmopen( our %HORSES, 'racehorses', 0666 )
  or croak 'Failed to open racehorse database with read/write permissions';

=head1 SYNOPSIS

Maintains the records of a race Horse.

    use RaceHorse;

    my $horse = RaceHorse->new( name => 'Existential Crisis Pony' );
    $horse->won;

=head1 SUBROUTINES/METHODS

=cut

my @properties = qw( wins places shows losses );
has $_ => ( is => 'rw', default => 0 ) for @properties;

=head2 new

Obtains the records of a named racehorse, returning
the instance for more races.

=cut

sub BUILD {
  my $self = shift;

  if ( defined $HORSES{$self->name} ) {
    my @cols = split ' ', $HORSES{$self->name};

    for ( @properties ) {
      $self->$_( shift @cols )
    }
  }
}

=head2 won/placed/showed/lost

Used to record the outcome of a single race.

=cut

my $incr = sub {
  my ( $self, $prop ) = @_;
  $self->$prop( $self->$prop + 1 )
};

sub won { $incr->( shift, 'wins' ) }
sub placed { $incr->( shift, 'places' ) }
sub showed { $incr->( shift, 'shows' ) }
sub lost { $incr->( shift, 'losses' ) }

=head2 standings

A human-readable record of the standings of the racehorse.

=cut

sub standings {
  my $self = shift;

  join ', ', map $self->$_ . " $_", @properties;
}

sub DEMOLISH {
  my $self = shift;

  $HORSES{$self->name} = join ' ', map $self->$_, @properties;
}

__PACKAGE__->meta->make_immutable;

=head1 AUTHOR

Robert Durie, C<< <robbiedurie at hotmail.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc RaceHorse


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=.>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/.>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/.>

=item * Search CPAN

L<http://search.cpan.org/dist/./>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2015 Robert Durie.

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

1; # End of RaceHorse
