use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Date::Oogaboogoo',
    license             => 'artistic_2',
    dist_author         => q{Robert Durie <robbiedurie@hotmail.co.uk>},
    dist_version_from   => 'lib/Date/Oogaboogoo.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'Date-Oogaboogoo-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
