use strict;
use warnings;
use POSIX qw(uname);

sub get_os_name {
    my ($s, $n, $r, $v, $m) = POSIX::uname();
    return 'linux64' if $m =~ /x86_64/i and $s =~ /Linux/i;
    return 'linux' if $s =~ /Linux/i;
    return 'darwin' if $s =~ /Darwin/i;
    return 'mswin32' if $s =~ /Windows|Cygwin/i;
    die 'No support for OS';
}

my $osname = get_os_name();

use Alien::Base::ModuleBuild;

my $builder = Alien::Base::ModuleBuild->new(
    module_name => 'Alien::SaleaeLogic',
    dist_abstract => 'Easy installation of the Saleae Logic SDK',
    license => 'perl',
    configure_requires => {
        'Alien::Base' => 0,
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'perl' => '5.8.1',
        'Alien::Base' => 0,
    },
    dist_author => 'Vikas N Kumar <vikas@cpan.org>',
    alien_name => "SaleaeDevice",
    alien_repository => {
        protocol => 'local',
        location => 'sdk',
        exact_filename => "${osname}.tar.gz",
        exact_version => '1.1.14',
    },
    alien_build_commands => [],
    alien_install_commands => [],
);
$builder->create_build_script;
$builder->dispatch('distmeta');
$builder->dispatch('manifest');

__END__
#### COPYRIGHT: 2014. Vikas N Kumar. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 2nd June 2014
#### LICENSE: Refer LICENSE file.
