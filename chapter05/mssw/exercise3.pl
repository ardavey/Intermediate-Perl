#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
use Data::Dumper;

my %total_bytes;

my $filename = 'chapter05/mssw/coconet.dat';
my $output   = 'chapter05/mssw/coconet-redump.dat';

# my $filename = 'chapter05/mssw/coconet-sample.dat';  # smaller sample

open( my $read_fh, '<:encoding(UTF-8)', $filename )
  or die "could not open file '$filename' $!";

while ( my $row = <$read_fh> ) {

    # check if the line starts with a '#' and skip it
    if ( $row =~ /^\s*#/ ) {
        next;
    }
    my ( $source, $destination, $bytes ) = split /\s+/, $row;
    $total_bytes{$source}{$destination} += $bytes;
}
close $read_fh;

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
my %report;
foreach my $source ( sort keys %total_bytes ) {
    for my $destination ( sort keys %{ $total_bytes{$source} } ) {
        $report{$source}->{destinations}{$destination} +=
          $total_bytes{$source}{$destination};
        $report{$source}->{total} += $total_bytes{$source}{$destination};
    }
}

open( my $write_fh, '>:encoding(UTF-8)', $output )
  or die "could not create file '$output' $!";

# Now lets redump the file
foreach my $source ( sort { $report{$b} cmp $report{$a} } keys %report ) {
    print $write_fh "$source\n";
    foreach my $destination (
        sort keys %{ $report{$source}->{destinations} }
      )
    {
        print $write_fh
          "  $destination $report{$source}->{destinations}{$destination}\n";
    }
}
close $write_fh;
