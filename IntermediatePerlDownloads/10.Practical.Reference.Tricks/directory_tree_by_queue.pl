use Data::Printer;

my $ds = {};
my @queue = ( [ '/etc', $ds ] );

while( my $tuple = shift @queue ) {
	opendir my $dh, $tuple->[0] or do { warn "Skipping $tuple->[0]: $!\n"; next };
	foreach my $file ( grep { ! /\A\.\.?\z/ } readdir $dh ) {	
		next if -l $file;
		unless( -d "$tuple->[0]/$file" ) {
			$tuple->[1]{$file} = undef;
			next;
			}
		push @queue, [ "$tuple->[0]/$file", $tuple->[1]{$file} = {} ];
		}
	}

p $ds;
