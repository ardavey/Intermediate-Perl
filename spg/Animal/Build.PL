use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Animal',
    license             => 'artistic_2',
    dist_author         => q{spg <simon.gross@datacash.com>},
    dist_version_from   => 'lib/Animal.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
    },
    add_to_cleanup     => [ 'Animal-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
