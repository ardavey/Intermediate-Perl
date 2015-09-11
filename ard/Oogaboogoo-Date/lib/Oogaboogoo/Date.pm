package Oogaboogoo::Date;

use 5.006;
use strict;
use warnings;
use parent qw( Exporter );

=head1 NAME

Oogaboogoo::Date - Understand your Oogaboogan friends' meeting invites!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

our @EXPORT_OK = qw(
  day_name
  month_name
);

our %EXPORT_TAGS = (
  all => [ @EXPORT_OK ],
);

my @days = qw( ark dip wap sen pop sep kir );
my @months = qw( diz pod bod rod sip wax lin sen kun fiz nap dep );

=head1 SYNOPSIS

This library provides convenient conversion between the Oogaboogans' date system and
the system that everyone else uses.

    use Oogaboogoo::Date qw( day_name month_name );

    ...

=head1 EXPORT

=over 1 

=item day_name

=item month_name

=back

=head1 SUBROUTINES/METHODS

=head2 day_name

Given a day index (1-7), returns an Oogaboogan day name.

=cut

sub day_name {
  my ( $num ) = @_;
  return _get_indexed_value( \@days, $num, 'day' );
}

=head2 month_name

Given a month index (1-12), returns an Oogaboogan month name.

=cut

sub month_name {
  my ( $num ) = @_;
  return _get_indexed_value( \@months, $num, 'month' );
}

=head2 _get_indexed_value

Internal method - returns the value at the given index in the referenced array.

=cut

sub _get_indexed_value {
  my ( $arr, $idx, $label ) = @_;
  $label //= 'value';
  my $max = scalar @$arr;
  if ( $idx < 1 || $idx > $max ) {
    die "$label '$idx' outside allowed range 1-$max";
  }
  return $arr->[$idx - 1];
}

=head1 AUTHOR

Andrew Davey, C<< <ardavey at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-oogaboogoo-date at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Oogaboogoo-Date>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Oogaboogoo::Date


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Oogaboogoo-Date>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Oogaboogoo-Date>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Oogaboogoo-Date>

=item * Search CPAN

L<http://search.cpan.org/dist/Oogaboogoo-Date/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2015 Andrew Davey.

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

1; # End of Oogaboogoo::Date
