use Test::More;
use Test::File;

my $nix_path = '/etc/hosts';
my $windows_path = 'C:\Windows\System32\drivers\etc\hosts';

my %supported_unixlike = map { $_ => 1 } qw( bsdos darwin linux openbsd freebsd solaris );

SKIP: {
  if ( ! $supported_unixlike{$^O} ) {
    skip "Not a unix or unix-like environment: can't test for $nix_path", 1;
  }

  file_readable_ok( $nix_path, 'Hosts file exists and can be read' );
}

SKIP: {
  if ( $^O ne 'MSWin32' ) {
    skip "Not a windows environment: can't test for $windows_path", 1;
  }

  file_readable_ok( $windows_path, 'Hosts file exists and can be read' );
}

&done_testing;
