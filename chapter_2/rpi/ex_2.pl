#!/use/bin/perl

use strict;
use warnings;

use Module::CoreList;

#print $Module::CoreList::version{5.014002};

#print Module::CoreList->first_release( 'Cwd'). "\n";

print $Module::CoreList::find_modules( /./, ('v5.14.2') );
#print "$modules\n";
