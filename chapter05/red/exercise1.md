### Exercise 1

Without running it, can you see what's wrong with this piece of a program? If you can't see the problem
after a minute or two, see whether trying to run it will give you a hint of how to fix it (you might try
turning on `warnings`):

```perl
my %passenger_1 = {
  name       => 'Ginger',
  age        => 22,
  occupation => 'Movie Star',
  real_age   => 35,
  hat        => undef,
};

my %passenger_2 = {
  name          => 'Mary-Ann',
  age           => 19,
  hat           => 'bonnet',
  favorite_food => 'corn',
};

my @passengers = (\%passenger_1, \%passenger_2);
```

**Answer:**

The passengers are named hashes, but are constructed from hash refs. This will error, as it will treat
the ref as the key to the first element of a hash (something like `HASH(0x3f289a)`) and will expect a 
value for this key (odd number of elements in hash assignment or something along those lines).

