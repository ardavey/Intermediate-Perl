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
	
    for my $source (reverse sort { $sum_total{$a} <=> $sum_total{$b} } keys %sum_total) {
	  print "Total bytes for " . $source . " = " . $sum_total{$source} . "\n";
      for my $destination (reverse sort { $total_bytes{$source}{$a} <=> $total_bytes{$source}{$b} } keys %{ $total_bytes{$source} }) {
        print " $destination:",
        " $total_bytes{$source}{$destination} bytes\n";
      }
      print "\n";
    }
