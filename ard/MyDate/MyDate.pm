package MyDate;

use strict;
use 5.010;

use Carp;
use Time::Piece;

our $AUTOLOAD;

my %allowed = (
  date => { idx => 3, offset => 0 },
  month => { idx => 4, offset => 1 },
  year => { idx => 5, offset => 1900 }, 
);

sub new {
  return bless( {}, shift );
}

sub AUTOLOAD {
  my $method = $AUTOLOAD;
  $method =~ s/.*:://;

  if ( exists $allowed{$method} ) {
    no strict 'refs';
    *$AUTOLOAD = sub { (localtime)[$allowed{$method}{idx}] + $allowed{$method}{offset} };
    goto &$AUTOLOAD;
  }
  croak "Method '$AUTOLOAD' does not exist";
}

sub DESTROY {}
