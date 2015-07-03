#!perl

use strict;
use warnings;
use utf8;

use Data::Dumper;
use File::Find;
use Time::Local;

my $target_dow           = 1;       # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my ( $sec, $min, $hour, $day, $mon, $yr, $dow ) = localtime;
my $start = timelocal( 0, 0, 0, $day, $mon, $yr );    # midnight today

while ( $dow != $target_dow ) {

    # Back up one day
    $start -= $seconds_per_day;                       # hope no DST! :-)
    if ( --$dow < 0 ) {
        $dow += 7;
    }
}
my $stop = $start + $seconds_per_day;

my ( $gather, $yield ) = gather_mtime_between( $start, $stop );
find( $gather, @starting_directories );

# my @files = $yield->();   # why not reference?!
my $files = $yield->();

## for my $file (@$files) { # reference ftw!
#foreach my $file (@$files){ # **** that last reference, i want a hash now!
#    my $mtime = ( stat $file )[9];    # mtime via slice
#    my $when  = localtime $mtime;
#    print "$when: $file\n";
#}
foreach my $file ( keys %$files ) {
    print "$files->{$file}: $file\n";
}

sub gather_mtime_between {
    my ( $start, $stop ) = @_;
    my %files = ();
    return (
        sub {
            if ( -f $_ ) {
                my $filename  = $File::Find::name;
                my $mtime     = ( stat $_ )[9];
                my $nice_time = gmtime($mtime);
                if ( ( $mtime > $start ) && ( $mtime < $stop ) ) {

                    # push @files, $filename; # bring on the hash!
                    $files{$filename} = $nice_time;
                }
            }
        },

        ## sub { return @files; } # go away list
        # sub { return \@files; } # go away list mkII
        sub { return \%files; }
    );
}
