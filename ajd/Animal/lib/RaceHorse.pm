package RaceHorse;

use 5.006;
use strict;
use warnings;

use parent qw( Horse );
use Scalar::Util qw( weaken );
use JSON;
use File::Slurp;

=head1 NAME

RaceHorse - Even better than the regular Horse

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
our $data_dir = "/tmp"; # I guess you could change this
my %REGISTRY;
my @fields = qw( wins places shows losses );

=head1 SYNOPSIS

Horse that you can race.

  my $horse = RaceHorse->new("Jim the Horse");
  $horse->won();
  $horse->lost();
  print $horse->standings();

=head1 SUBROUTINES/METHODS

=head2 new

Build a new RaceHorse out of whatever those guys are made from. Clay I guess?

=cut

sub new {

  my $self = shift->SUPER::new( @_ );

  my $file = "$data_dir/" . $self->name() . ".json";
  my %data;

  # Load up previous results if there are any
  if ( -e $file ) {
    %data = %{ JSON->new()->utf8(1)->relaxed(1)->decode( scalar( read_file( $file ) ) ) };
  }
  else {
    %data = map { $_ => 0 } @fields;
  }

  @{$self}{@fields} = @data{@fields};

  $REGISTRY{$self->{name}} = $self;
  weaken( $REGISTRY{$self->{name}} );

  return $self;

}

=head2 won

Call this when your horse wins a race

=cut

sub won {
  shift->{wins}++;
}

=head2 placed

Call this when your horse is first loser in a race. Or second loser
I guess. Who even looks that far?

=cut

sub placed {
  shift->{places}++;
}

=head2 showed

Call this when your horse makes it through a race without getting shot.

=cut

sub showed {
  shift->{shows}++;
}

=head2 lost

Call this when your horse makes it through a race without getting shot
but should have been.

=cut

sub lost {
  shift->{losses}++;
}

=head2 standings

Call this to see your horse stats. Maybe you could place Horse Top Trumps
with them.

=cut

sub standings {
  my $self = shift;
  return join( ', ', map { "$self->{$_} $_" } @fields );
}

sub DESTROY {

  my $self = shift;

  # Construct some data to save
  my %data;
  @data{ @fields } = @{$self}{ @fields };

  # Write it to file
  my $json = JSON->new->utf8(1)->pretty(1)->encode( \%data );
  write_file( "$data_dir/" . $self->name() . ".json", $json );

}

=head1 AUTHOR

Alex Deas, C<< <alex at toothball.co.uk> >>

=head1 BUGS

Obviously there are no bugs.

=head1 MORAL SUPPORT

You can do this. We believe in you.

=head1 LICENSE AND COPYRIGHT

Copyright 2015 Alex Deas.

Copy this at your own peril.

=cut

1; # End of RaceHorse
