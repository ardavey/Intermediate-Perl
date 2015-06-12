use v5.14;

my $output_lines = 0;
my $records = $ARGV[0] // 50;

my $crew_items = [ qw( flares rope GPS patch_kit marine_radio ) ];
my $luxuries   = [ qw( TV telephone_dialer corkscrew valet golf_bag ) ];
my $tools      = [ qw( screwdriver duct_tape WD40 thermocouple batteries ) ];
my $common     = [ qw( cheese steak_knife umbrella fork shampoo cheetos) ];

my $crew_wants = {
	Gilligan   => [ $crew_items ],
	Skipper    => [ $crew_items ],
	Thurston   => [ $luxuries ],
	Ginger     => [ ],
	'Mary Ann' => [ ],
	Professor  => [ $tools ],
	};

foreach my $value ( values $crew_wants ) {
	push $value, $common;
	}

while( $output_lines < $records ) {
	state %Seen;
	my $castaway       = ( keys %$crew_wants )[ rand keys %$crew_wants ];
	my $castaway_array = $crew_wants->{$castaway};
	my $select_from    = $castaway_array->[ rand @$castaway_array ];
	
	my $item = $select_from->[ rand @$select_from ];

	next unless $item;
	next if $Seen{$castaway}{$item}++;

	$output_lines++;
	say join "\t", $castaway, $item;
	}
