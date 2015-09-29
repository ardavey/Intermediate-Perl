use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Animalv2',
    license             => 'artistic_2',
    dist_author         => q{Alex Deas <alex@toothball.co.uk>},
    dist_version_from   => 'lib/Animalv2.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Moose' => 0,
        'Moose::Role' => 0,
    },
    add_to_cleanup     => [ 'Animalv2-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
