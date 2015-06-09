#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
use Data::Dumper;

my %total_bytes;

my $filename = 'chapter05/mssw/coconet.dat';

# my $filename = 'chapter05/mssw/coconet-sample.dat';  # smaller sample

open( my $fh, '<:encoding(UTF-8)', $filename )
  or die "could not open file '$filename' $!";

while ( my $row = <$fh> ) {
    my ( $source, $destination, $bytes ) = split /\s+/, $row;
    $total_bytes{$source}{$destination} += $bytes;
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
my %report;
foreach my $source ( sort keys %total_bytes ) {
    for my $destination ( sort keys %{ $total_bytes{$source} } ) {
        $report{$source}->{destinations}{$destination} +=
          $total_bytes{$source}{$destination};
        $report{$source}->{total} += $total_bytes{$source}{$destination};
    }
}

# Now lets sort it by the overall total for each host. We'll need to define a custom sort so that we get at the total without tearing down the hash
foreach my $source (
    sort { $report{$b}->{total} <=> $report{$a}->{total} }
    keys %report
  )
{
    print ">> Total for source '$source' is: $report{$source}->{total}\n";
    foreach my $destination (
        sort {
            $report{$source}->{destinations}{$b}
              <=> $report{$source}->{destinations}{$a}
        }
        keys %{ $report{$source}->{destinations} }
      )
    {
        printf( "%-30s => %30s : %10d bytes\n",
            $source, $destination,
            $report{$source}->{destinations}{$destination} );
    }
    print "\n";
}
