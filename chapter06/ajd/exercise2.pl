#!/usr/bin/perl

use strict;
use warnings;
use File::Slurp;
use JSON;

# Get the file read
my %total_bytes;

# Import the old file - JSON version
my $json = new JSON();
my $data_file = 'logdata.json';

if ( -s $data_file ) {
  # Needed to force scalar context as otherwise File::Slurp returns an array of lines
  %total_bytes = %{ $json->decode( scalar ( read_file( $data_file ) ) ) };
}

# This time if a new log file isn't specified, it goes on
# to list the totals from the data file
if ( !scalar @ARGV ) {
  print "No new data specied, using existing totals\n";
}
elsif ( -e $ARGV[0] ) {
  while ( <> ) {
    if ( /^#/) { next };
    my ( $source, $destination, $bytes ) = split;
    $total_bytes{$source}{$destination} += $bytes;
  }
}
else {
  die( "File $ARGV[0] not found\n" );
}

# Store the updated data file
write_file( $data_file, $json->pretty(1)->encode( \%total_bytes ) );

# Sorting and printing
foreach my $host ( sort keys %total_bytes ) {

  print "$host\n";
  foreach my $dest ( sort keys $total_bytes{$host} ) {
    print "\t$dest $total_bytes{$host}{$dest}\n";
  }

}

