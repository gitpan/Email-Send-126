#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Email::Send::126' ) || print "Bail out!\n";
}

diag( "Testing Email::Send::126 $Email::Send::126::VERSION, Perl $], $^X" );
