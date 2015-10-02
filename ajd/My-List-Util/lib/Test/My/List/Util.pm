package Test::My::List::Util;

use 5.006;
use strict;
use warnings;

our $VERSION = '0.01';
our @EXPORT;

use Test::Builder;

use Exporter qw( import );
@EXPORT = qw( sum_ok );

=head1 POD?

Not today POD, not today.

=cut

my $Test = Test::Builder->new();

sub sum_ok {

  my ( $actual, $expected, $message ) = @_;

  if ( $actual == $expected ) {
    $Test->diag( $message );
    $Test->ok(1);
  }
  else {
    $Test->diag( "FAILED: $message " );
    $Test->ok(0);
  }
}

1; # End of Test::My::List::Util
