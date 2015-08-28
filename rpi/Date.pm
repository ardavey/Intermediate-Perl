package Date;

use strict;
use warnings;

use Time::Piece;
use Carp qw( croak );

sub new {
  bless {}, shift;
}

sub AUTOLOAD {
  my $time = localtime;

  our $AUTOLOAD;
  (my $method = $AUTOLOAD) =~ s/.*:://s;
  if ( $method eq 'date' ) {
    eval q{
      sub date{
        return $time->date();
      }
    };
    die $@ if $@;
    goto &date;
  }
  elsif ( $method eq 'month' ) {
    eval q{
      sub month{
        return $time->fullmonth();
      }
    };
    die $@ if $@;
    goto &month;
  }
  elsif ( $method eq 'year' ) {
    eval q{
      sub year{
        return $time->year();
      }
    };
    die $@ if $@;
    goto &year;
  }
  else {
    croak "$_[0]->$method these are not the methods you are looking for";
  }
}

1;
