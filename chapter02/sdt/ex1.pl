#!/usr/bin/perl
use warnings;
use strict;
use Cwd qw( abs_path );
use File::Spec qw( curdir );

opendir(DIR, File::Spec->curdir()) or die $!;
while (my $file = readdir(DIR)) {
  print " " x 4 .abs_path($file) . "\n";
}
closedir(DIR);
