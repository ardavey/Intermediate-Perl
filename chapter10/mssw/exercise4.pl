#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

sub data_for_path {
    my $path = shift;
    if ( -f $path || -l $path ) {
        return undef;
    }

    if ( -d $path ) {
        my %directory;
        opendir PATH, $path or die "Cannot opendir $path: $!";
        my @names = readdir PATH;
        closedir PATH;
        foreach my $name (@names) {
            next if $name eq '.' or $name eq '..';
            $directory{$name} = data_for_path("$path/$name");
        }
        return \%directory;
    }
    warn "$path is neither a file nor a directory\n";
    return undef;
}

sub dump_data_for_path {
    my ( $path, $data, $indent ) = @_;
    $indent //= 0;
    if ( !defined $data ) {
        indent_print( "$path", $indent );
        return;
    }

    if (%$data) {
        indent_print( "$path, with contents:", $indent );
        foreach ( sort keys %$data ) {
            dump_data_for_path( "$_", $data->{$_}, $indent + 2 );
        }
    }
    else {
        indent_print( "$path, an empty directory", $indent );
    }
}

sub indent_print {
    my ( $string, $indent ) = @_;
    print( ( ' ' x $indent ) . "$string\n" );
}

if ( !$ARGV[0] ) {
    print STDERR "no directory supplied!!\n";
    exit 1;
}

my $data = data_for_path( $ARGV[0] );
dump_data_for_path( $ARGV[0], $data );
