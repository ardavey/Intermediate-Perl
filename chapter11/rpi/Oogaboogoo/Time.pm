package Oogaboogoo::Time;

sub get_converters{

  my %day = ( Sunday    => 'ark',
              Monday    => 'dip',
              Tuesday   => 'wap',
              Wednesday => 'sen',
              Thursday  => 'pop',
              Friday    => 'sep',
              Saturday  => 'kir',
              );
  my %month = ( January => 'diz',
                February => 'pod',
                March => 'bod',
                April => 'rod',
                May => 'sip',
                June => 'wax',
                July => 'lin',
                August => 'sen',
                September => 'kun',
                October => 'fiz',
                November => 'nap',
                December => 'dep',
                );

  my $get_day = sub { return $day{ shift @_ } };

  my $get_month = sub { return $month{ shift @_ } };

  return ( $get_day, $get_month );
}

1;
