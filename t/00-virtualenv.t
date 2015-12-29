use strict;
use warnings;

use File::Spec::Functions qw(catfile);
use File::Temp qw(tempdir);
use Test::More tests => 3;


my $venv = tempdir(CLEANUP=>1);


do {
    # Test venv creation.
    my $virtualenv = catfile('.', 'virtualenv.pl');  # TODO: use absolute path
    ok(system($virtualenv, $venv) == 0, 'create');
};


do {
    # Test venv executables.
    my $bin = catfile($venv, 'bin');
    my $perl = catfile($bin, 'perl');
    ok(system($perl, '--version') == 0, 'perl');
    my $cpanm = catfile($bin, 'cpanm');
    ok(system($cpanm, '--version') == 0, 'cpanm');
};
