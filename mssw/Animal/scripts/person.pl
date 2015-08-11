#!/usr/bin/perl -Ilib

use strict;
use warnings;

use Data::Dumper;

use Person;
use Mouse;
use Cow;

Cow->speak();
Mouse->speak('Braaaiiiins');
Person->speak();
Person->speak('Hello, World');
