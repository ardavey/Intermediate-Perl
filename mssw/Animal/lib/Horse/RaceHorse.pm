package Horse::RaceHorse;

use 5.006;
use strict;
use warnings;

use parent qw( Horse );

use File::HomeDir;
use File::Path qw(make_path );
use File::Slurp;
use JSON;

=head1 NAME

Horse::RaceHorse - a Horse that can run

RaceHorse statistics are stored in ~/.Animal/Horse/

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

use constant {
    DATA_DIR => File::HomeDir->my_home . '/.Animal/Horse/RaceHorse/',
};  


=head1 SYNOPSIS

Speedy Horse

=head1 SUBROUTINES/METHODS

=head2 new

@Override

=cut

sub new {
    my $self = shift->SUPER::new(@_);
    my $filename = DATA_DIR . $self->name;
    
    my $raw_data = '{}';
    if( -e $filename ){
        $raw_data = read_file( $filename, bin_mode => ':utf8');
    }
    $self->{data} = decode_json( $raw_data);
    
    $self->{data}->{$_} //= 0 for qw( wins places shows losses);
    
    return $self;
}

=head2 won

adds a win for this RaceHorse

=cut

sub won {
    shift->{data}->{wins}++;
}

=head2 placed

adds a placed for this RaceHorse

=cut

sub placed {
    shift->{data}->{places}++;
}

=head2 showed

adds a whowed for this RaceHorse

=cut

sub showed {
    shift->{data}->{shows}++;
}

=head2 lost

adds a loss for this RaceHorse

=cut

sub lost {
    shift->{data}->{losses}++;
}

=head2 standings

get the standings for this RaceHorse

=cut

sub standings {
    my $self = shift;
    return join ', ', map "$self->{data}->{$_} $_", qw( wins places shows losses);
}

=head2 DESTROY

This RaceHorse has had a good run... probably...

=cut

sub DESTROY {
    my $self = shift;
    my $filename =  DATA_DIR . $self->name;
    if( !-d DATA_DIR){
        make_path( DATA_DIR);
    }
    write_file( $filename, {binmode => ':utf8'}, encode_json($self->{data}) ) ;
    print '[', $self->name, ' has died... but their legacy will be remembered!]', "\n";
}

=head1 AUTHOR

Michael Wambeek, C<< <mikewambeek at hotmail.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then youll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Horse::RaceHorse


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

1; # End of Horse::RaceHorse
