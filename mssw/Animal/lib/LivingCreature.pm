package LivingCreature;

use 5.006;
use strict;
use warnings;

use Carp qw( croak );

=head1 NAME

LivingCreature - The great new LivingCreature!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use LivingCreature;

    my $foo = LivingCreature->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don@apos;t export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 speak

Allows a LivingCreature to speak

=cut

sub speak {
    my $class = shift;
    my ($say) = @_;
    
    $say //= $class->sound;
    
    if ( ref $class ) {
        print $class->name, " says: $say!\n";
    }
    else {
        print "a $class goes ", $class->sound, "!\n";
    }
}

=head2 sound

Implement me!!!

=cut

sub sound {
    croak "Sound is unimplemented!!!";
}

=head2 default_colour

returns the default colour of a LivingCreature. Override this where necessary.

=cut

sub default_colour {
    return 'dirty';
}

=head2 new

Creates an instance

=cut

sub new {
    my $class  = shift;
    my ($name) = @_;
    my $self   = { name => $name, };

    return bless $self, $class;
}

=head2 name

can be used to get/set the name of a LivingCreature

=cut

sub name {
    my $self = shift;

    # Was this method called statically?
    if ( !ref $self ) {

        # It was! well we cant set anything so we'll just die
        if (@_) {
            croak "You can't set a name on a default $self";
        }

        return $self;
    }

    if (@_) {
        $self->{name} = $_[0];
    }
    else {
        return $self->{name};
    }
}

=head2 colour

can be used to get/set the colour of a LivingCreature

=cut

sub colour {
    my $self = shift;

    # Was this method called statically?
    if ( !ref $self ) {

        # It was! well we cant set anything so we'll just die
        if (@_) {
            croak "You can't set a colour on a default $self";
        }

        return $self->default_colour;
    }

    if (@_) {
        $self->{colour} = $_[0];
    }
    else {
        return $self->{colour};
    }
}

=head1 AUTHOR

Michael Wambeek, C<< <mikewambeek at hotmail.co.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc LivingCreature


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

1;    # End of LivingCreature
