#!/usr/bin/perl

use strict;
use warnings;

use Cwd;
use File::Spec;

my $cwd = getcwd();

my $thing = File::Spec->catfile($cwd);

print "How exactly is File::Spec and Cwd supposed to help list directories?!?!\n";

opendir (DIR, $thing) or die $!;

while (my $file = readdir(DIR)){
    print( ' ' x4, $file, "\n");
}

close DIR;