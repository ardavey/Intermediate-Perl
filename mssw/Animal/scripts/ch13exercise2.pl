#!/usr/bin/perl -Ilib

use strict;
use warnings;

use Animal;
use Cow;
use Horse;
use Mouse;
use Sheep;

use Data::Dumper;

print
"Please enter some animals to add to your barnyard. (Type 'done' when finished)\n";

my @barnyard;
while (<STDIN>) {
    chomp;
    my $animal = ucfirst lc $_;

    if ( $animal eq 'Done' ) {
        last;
    }

    eval { $animal->sound; };
    if ($@) {
        print "We have no " . $animal . "s here!";
    }
    else {
        push @barnyard, $animal;
    }

}

if ( !scalar @barnyard ) {
    print "The barnyard is very quiet.... Too quiet....";
    exit 0;
}

foreach my $animal (@barnyard) {
    $animal->speak;
}

