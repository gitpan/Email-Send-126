use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Email::Send::126',
    AUTHOR              => q{Ken Peng <yhpeng@cpan.org>},
    VERSION_FROM        => 'lib/Email/Send/126.pm',
    ABSTRACT_FROM       => 'lib/Email/Send/126.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'MIME::Lite' => 0,
        'MIME::Words' => 0,
        'MIME::Base64' => 0,
        'Authen::SASL' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Email-Send-126-*' },
);
