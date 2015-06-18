#!/usr/bin/perl
use v5.10;
use strict;
use warnings;

sub read_log_file {
    my ( $filename ) = @_;
    
    if( ! -e $filename ){
        die ("File $filename not found!");
    }
    
    my %data;
    open( my $read_fh, '<:encoding(UTF-8)', $filename )
      or die "could not open file '$filename' $!";
    while ( my $row = <$read_fh> ) {

        # check if the line starts with a '#' and skip it
        if ( $row =~ /^\s*#/ ) {
            next;
        }
        my ( $source, $destination, $bytes ) = split /\s+/, $row;
        $data{$source}{$destination} += $bytes;
    }
    close $read_fh;
    
    return \%data;
}

# Lets create a complex hash! \o/
#  %report = (
#   $source => {
#     destinations = {
#       $destination => $bytes,
#       ...
#     },
#     total = $total_bytes,
#   },
#   ...
# );
sub generate_report {
    my ($existing_report, $data_ref) = @_;
    
    my %data = %$data_ref;
    my %report = %{$existing_report // {}};
    foreach my $source ( sort keys %data ) {
        for my $destination ( sort keys %{ $data{$source} } ) {
            $report{$source}->{destinations}{$destination} +=
              $data{$source}{$destination};
            $report{$source}->{total} += $data{$source}{$destination};
        }
    }
    return \%report;
}

1;