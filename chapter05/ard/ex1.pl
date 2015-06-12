# Declaring a hash using '%' but using braces which denote an anonymous hash - oops!
my %passenger_1 = {
  name => 'Ginger',
  age => 22,
  occupation => 'Movie Star',
  real_age => 35,  # Ginger is a liar.
  hat => undef,
};

# Repeat offence!
my %passenger_2 = {
  name => 'Mary-Ann',
  age => 19,
  hat => 'bonnet',  # Nobody over the age of 3 should be allowed to wear a bonnet.
  favorite_food => 'corn',
};

# And now we're trying to make an array of references to our weird hash/hashref hybrids - oh no!
my @passengers = ( \%passenger_1, \%passenger_2 );
