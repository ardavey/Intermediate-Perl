#!/usr/bin/perl
use v5.10;
use strict;
use warnings;
use Storable qw( nstore retrieve );
use Data::Dumper;

require '/home/codio/workspace/chapter06/mssw/file_reader.pm';

my $output   = '/home/codio/workspace/chapter06/mssw/running-totals.dat';


if ( !scalar @ARGV){
    die( "Please specify a log file" );
}

# First lets load up the new old data
my $report_ref;
if( -s $output){
    $report_ref = retrieve $output;
}

my $filename = $ARGV[0];
my $data = read_log_file( $filename );
my %report = %{ generate_report( $report_ref, $data ) };



print "Dumping new totals: " . Dumper(\%report);

nstore( \%report, $output);
