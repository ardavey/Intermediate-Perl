#!/usr/bin/perl

use strict;
use warnings;

use Person;
use Cow;

Person->speak( 'Hello World!', 'socks' );
Person->speak();
Cow->speak();
Cow->speak( 'Hey Doc, over here!' );
