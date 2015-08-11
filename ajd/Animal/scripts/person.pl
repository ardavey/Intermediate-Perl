#!/usr/bin/perl

use strict;
use warnings;

use Person;
use Horse;

Person->speak( 'Hello, World!' );
Person->speak();

# A talking horse?
Horse->speak( 'Why yes, of course!' );



