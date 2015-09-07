package My::List::Util;

use 5.006;
use strict;
use warnings;

use Exporter 'import';

=head1 NAME

My::List::Util - Some basic list utilities

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';

=head1 SYNOPSIS

Provides some list utilities

    use My::List::Util;

    my $foo = My::List::Util::sum( 1..5 );
    # $foo = 15;

=head1 EXPORTS

  sum
  shuffle
  :all

=cut

our @EXPORT;
our @EXPORT_OK = qw( sum shuffle );

our %EXPORT_TAGS = (
    all => [ @EXPORT, @EXPORT_OK ],
);

=head1 SUBROUTINES/METHODS

=head2 sum

When supplied with a numeric list, sum() returns the sum total. Any
non-numeric values are disregarded as 0;

=cut

sub sum {

  my $sum = 0;

  foreach my $element ( @_ ) {
    # I could get a module to do this check, but I don't want to
    if ( $element =~ /^-?\d+(?:\.\d+)?$/ ) {
      $sum += $element;
    }
  }

  return $sum;

}

=head2 shuffle

Shuffles the supplied list

Uses a modern Fisher-Yates algorithm

=cut

sub shuffle {

  my @array = @_;

  for ( my $i = scalar( @array ) - 1 ; $i > 0 ; $i-- ) {
    my $j = int( rand($i + 1) );
    @array[$i, $j] = @array[$j, $i];
  }

  return @array;

}

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-my-list-util at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=My-List-Util>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc My::List::Util


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=My-List-Util>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/My-List-Util>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/My-List-Util>

=item * Search CPAN

L<http://search.cpan.org/dist/My-List-Util/>

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

1; # End of My::List::Util
