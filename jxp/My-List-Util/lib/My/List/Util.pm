package My::List::Util;

use 5.006;
use strict;
use warnings;
use List::Util;
use Scalar::Util qw(looks_like_number);

=head1 NAME

My::List::Util - My implememtations of standard list methods.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Provides wrappers around standard list methods in a pointless fashion.

=head1 EXPORT

=head1 SUBROUTINES/METHODS

=head2 sum

Adds together the elements of a list

=cut

sub sum {
  my @list = @_;
  my $sum = 0;
  foreach my $value ( @list ){
    if(looks_like_number($value)){
      $sum += $value;
    }
    else{
      print "Warning: value $value ignored due to not being a number";
    }
  }
  return $sum;
}

=head2 shuffle

Shuffles list

=cut

sub shuffle {
  my @list = @_;
  return List::Util::shuffle( @list );
}

=head1 AUTHOR

Jonathan, C<< <jp at example.com> >>

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

Copyright 2015 Jonathan.

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
