use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Email::Send::126',
    AUTHOR              => q{Peng Yong Hua <pyh@cpan.org>},
    VERSION_FROM        => 'lib/Email/Send/126.pm',
    ABSTRACT_FROM       => 'lib/Email/Send/126.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Email-Send-126-*' },
);
