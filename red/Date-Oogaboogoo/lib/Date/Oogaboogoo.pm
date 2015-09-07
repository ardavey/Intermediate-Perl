package Date::Oogaboogoo;

use v5.16;
use strict;
use warnings;
use parent qw( Exporter );

our @EXPORT;
our @EXPORT_OK = qw(
  number_to_day_name
  number_to_month_name
  );
our %EXPORT_TAGS = (
  all => [ @EXPORT, @EXPORT_OK ],
  );

my @days = qw( ark dip wap sen pop sep kir );
my @months = qw( diz pod bod rod sip wax lin sen kun fiz nap dep );

=head1 NAME

Date::Oogaboogoo - Conversion utilities for the Oogaboogoo calendar.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Converts western calendar date offsets to Oogaboogoo calendar dates.

    use Date::Oogaboogo qw(:all);

    my $day = number_to_day_name(1); # dip
    my $mon = number_to_month_name(3); # rod

=head1 EXPORT

Exports:
  C<number_to_day_name( $ndx )>
  C<number_to_month_name( $ndx )>

=head1 SUBROUTINES

=head2 C<number_to_day_name( $ndx )>

Looks up the day of the week by index (0-6) returning the Oogaboogoo name for the day.

=cut

sub number_to_day_name {
  my ( $i ) = @_;

  if ( $i < 0 || $i > $#days ) {
    die sprintf 'Index [%d] out of bounds, there are only %d days in the Oogaboogoo week', $i, scalar @days;
  }

  return $days[$i];
}

=head2 C<number_to_month_name( $ndx )>

Looks up the month by index (0-11) returning the Oogaboogoo name for the month.

=cut

sub number_to_month_name {
  my ( $i ) = @_;

  if ( $i < 0 || $i > $#months ) {
    die sprintf 'Index [%d] out of bounds, there are only %d months in the Oogaboogoo calendar', $i, scalar @months;
  }

  return $months[$i];
}

=head1 AUTHOR

Robert Durie, C<< <robbiedurie at hotmail.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-date-oogaboogoo at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Date-Oogaboogoo>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Date::Oogaboogoo


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Date-Oogaboogoo>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Date-Oogaboogoo>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Date-Oogaboogoo>

=item * Search CPAN

L<http://search.cpan.org/dist/Date-Oogaboogoo/>

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

1; # End of Date::Oogaboogoo
