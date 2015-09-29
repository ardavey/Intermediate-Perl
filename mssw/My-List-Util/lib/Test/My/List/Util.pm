package Test::My::List::Util;

use 5.006;
use strict;
use warnings;

use Exporter qw(import);
use vars qw(@EXPORT $VERSION);

use Test::Builder;

my $Test = new Test::Builder();

$VERSION = '3.14';
@EXPORT = qw(sum_ok);

=head1 NAME

Test::My::List::Util - Test utility module for My::List::Util

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Helps with testing My::List::Util

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you dont export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 sum_ok

checks that a list can sum correctly.

    sum_ok( $actual, $expected );
    sum_ok( $actual, $expected, "The sums don't match!" );

=cut

sub sum_ok {
    my ( $actual, $expected, $message) = @_;
    
    if( !defined $actual && !defined $expected ){
        $Test->ok(1, $message);
        return 1;
    }
    elsif( !defined $actual ){
        $Test->diag( "Actual value was not defined, expected [$expected]!\n" );
        $Test->ok(0, $message);
        return 0;
    }
    elsif( !defined $expected ){
        $Test->diag( "Actual value was [$actual], expected undefined!\n");
        $Test->ok(0, $message);
        return 0;
    }
    else{
        # We have two defined values now.
        # Lets see if they're both scalars
        my $actual_ref = ref $actual;
        my $expected_ref = ref $expected;
        
        if( $actual_ref && $expected_ref ){
            # we have two references for some reason....
            if( $actual_ref eq $expected_ref){
                # They're both the same type of reference, so lets just say they're the same.
                $Test->diag( "Returning ok for two matching reference types - [$actual_ref]!\n");
                $Test->ok(1, $message);
                return 1;
            }
            else{
                # We have two differing reference types
                $Test->diag( "Actual value ref[$actual_ref] does not match expected value ref[$expected_ref]!\n");
                $Test->ok(0, $message);
                return 0;
            }
        }
        elsif( $actual_ref ){
            $Test->diag( "Actual value ref[$actual_ref] does not match expected value [$expected]!\n" );
            $Test->ok(0, $message);
            return 0;
        }
        elsif( $expected_ref ){
            $Test->diag( "Actual value [$actual] does not match expected value ref[$expected_ref]!\n" );
            $Test->ok(0, $message);
            return 0;
        }
        else{
            # We have two scalars \o/
            # Now lets check they're both numbers
             my $regex = qr/^\d+\.?\d*$/;
            my $actual_regex = $actual =~ $regex;
            my $expected_regex = $expected =~ $regex;
            if( !$actual_regex || ! $expected_regex ){
                # One or both might not be a number, so lets compare them as strings
                if( $actual eq $expected ){
                    $Test->ok(1, $message);
                    return 1;
                }
                else{
                    $Test->diag( "Actual value [$actual] does not equal expected value [$expected]!\n");
                    $Test->ok(0, $message);
                    return 0;
                }
            
            }
            else{
                # We should now have 2 numbers!!
                if( $actual eq $expected){
                    $Test->ok(1, $message);
                    return 1;
                }
                else{
                    $Test->diag( "Actual value [$actual] does not equal expected value [$expected]!\n");
                    $Test->ok( 0, $message);
                    return 0;
                }
            }
        }
    }
    $Test->diag( "We somehow failed to compare anything!\n");
    $Test->ok( 0, $message);
    return 0;
}


=head1 AUTHOR

Michael Wambeek, C<< <mikewambeek at hotmail.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Test::My::List::Util


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

Copyright 2015 Michael Wambeek.

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

1; # End of Test::My::List::Util
