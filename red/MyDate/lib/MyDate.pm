package MyDate;

use v5.16;
use strict;
use warnings;
use Carp;
our $AUTOLOAD;

=head1 NAME

MyDate - Yet another simple utility for dates

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Simple OO interface onto localtime.

    use MyDate;

    my $date = MyDate->new();
    my ( $day, $month, $year ) =
      $date->date, $date->month, $date->year; # e.g. 26 4 2015
    ...

=head1 SUBROUTINES/METHODS

=head2 new

Get an instance of MyDate. Not a whole lot to configure here.

=cut

sub new {
  bless \my $self, $_[0]
}

=head2 date

Get the date of the current calendar month (1-31).

=head2 month

Get the month of the current year (1-12).

=head2 year

Get the current year (1900+).

=cut

sub AUTOLOAD {
  my $method = $AUTOLOAD =~ s/.*:://gr;

  state $methods = {
    date => sub { (localtime)[3] },
    month => sub { (localtime)[4] + 1 },
    year => sub { (localtime)[5] + 1900 },
    };

  if ( !defined $methods->{$method} ) {
    croak "No method $AUTOLOAD";
  }

  do {
    no strict 'refs';
    *$AUTOLOAD = $methods->{$method}
  };

  goto &$AUTOLOAD
}

=head1 AUTHOR

Robert Durie, C<< <robbiedurie at hotmail.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mydate at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MyDate>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MyDate


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MyDate>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MyDate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MyDate>

=item * Search CPAN

L<http://search.cpan.org/dist/MyDate/>

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

1; # End of MyDate
