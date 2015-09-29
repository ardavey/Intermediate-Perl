package RaceHorse;

use 5.006;
use strict;
use warnings;

use Moose;
use namespace::autoclean;

extends 'Horse';
with 'Racer';

=head1 NAME

RaceHorse - How many races can it win before going to the glue factory?

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

use parent qw(Horse);
use JSON qw( encode_json decode_json );
use File::Slurp;

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Horse;

    my $foo = Horse->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 get_type

=cut

sub get_type {
  return "RaceHorse";
}

=head2 get_voice

=cut

sub get_voice {
  return "strong neigh";
}

my $file = "stats.json";
my @stats = qw( wins places shows losses );

sub new {
  my $self = shift->SUPER::new(@_);

  my $stats_data;

  if ( -e $file ) {
    eval {
      $stats_data = decode_json( scalar( read_file( $file ) ) );
    };
    if ( $@ ) {
      print "Invalid JSON: $@";
      $stats_data = map { $_ => 0 } @stats;
    }
  }
  else {
    $stats_data = map { $_ => 0 } @stats;
  }

  @{$self}{@stats} = @{$stats_data}{@stats};

  return $self;
}

sub DESTROY {
  my ( $self ) = @_;

  my $stats;

  @{$stats}{ keys %{$self} } = values %{$self};

  my $json = encode_json( $stats );
  write_file( $file, $json );

  $self->SUPER::DESTROY if $self->can( 'SUPER::DESTROY' );
}

__PACKAGE__->meta->make_immutable;

=head1 AUTHOR

spg, C<< <simon.gross at datacash.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Horse


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

Copyright 2015 Simon Gross.

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

1; # End of Horse
