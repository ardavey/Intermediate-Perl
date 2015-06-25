#!/usr/bin/perl
use v5.10;

	my %total_bytes;
	my $filename='coconet.dat';
	open(my $fh, $filename);
    while (my $row = <$fh>) {
      my ($source, $destination, $bytes) = split '\t', $row;
      $total_bytes{$source}{$destination} += $bytes;
    }
	
	my %sum_total;
	
	for my $source ( keys %total_bytes) {
      for my $destination ( keys %{ $total_bytes{$source} }) {
         $sum_total{$source} += $total_bytes{$source}{$destination};
      }
    }
	
	my $out_file = 'coconet_sorted.dat';
	open( my $out_fh, ">" , $out_file );
	
    for my $source ( sort keys %sum_total ) {
	  print $out_fh $source . "  " . $sum_total{$source} . "\n";
      for my $destination ( sort keys %{ $total_bytes{$source} }) {
        print $out_fh "  $destination",
        "  $total_bytes{$source}{$destination}\n";
      }
    }
    close( $fh );
	close( $out_fh );
