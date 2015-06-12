sub check_required_items { 
	my $who = shift;
	my $items = shift;

	my %whose_items = map { $_, 1 } @$items;

	my @required = qw(preserver sunscreen water_bottle jacket);
	my @missing = ( );

	for my $item (@required) {
		unless ( $whose_items{$item} ) { # not found in list?
		print "$who is missing $item.\n";
		push @missing, $item; }
	}

	if (@missing) {
		print "Adding @missing to @$items for $who.\n"; 
		push @$items, @missing;
	} 
}
