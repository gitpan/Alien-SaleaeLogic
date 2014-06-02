use strict;
use warnings;
use Test::More;

BEGIN { use_ok('Alien::SaleaeLogic'); }

my $alien = new_ok('Alien::SaleaeLogic');
can_ok($alien, 'cflags');
isnt($alien->cflags, undef, "has cflags()");
note($alien->cflags);
can_ok($alien, 'libs');
isnt($alien->libs, undef, "has libs()");
note($alien->libs);

done_testing();
__END__
#### COPYRIGHT: Vikas N Kumar. All Rights Reserved
#### AUTHOR: Vikas N Kumar <vikas@cpan.org>
#### DATE: 2nd June 2014
#### LICENSE: Refer LICENSE file.
