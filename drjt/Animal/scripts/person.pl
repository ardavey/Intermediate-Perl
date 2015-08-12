#!/usr/bin/perl -Ilib
use 5.014;
use warnings;
use strict;

use Person;

Person->speak;
Person->speak( "Hello,", "World!" );
