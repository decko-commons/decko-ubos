#!/usr/bin/perl
#
# Simple test for gladiwashere-php-mysql.
#
# Copyright (C) 2014 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;
use warnings;

package DeckoTest;

use UBOS::WebAppTest;

# The states and transitions for this test

my $TEST = new UBOS::WebAppTest(
    appToTest   => 'decko',
    description => 'Tests whether decko app correctly loads',

    # packageDbsToAdd => {
    #    'toyapps' => 'http://depot.ubos.net/$channel/$arch/toyapps'
    # },

    checks => [
            new UBOS::WebAppTest::StateCheck(
                    name  => 'virgin',
                    check => sub {
                        my $c = shift;

                        $c->getMustContain(    '/', 'Welcome, Decker!', undef, 'Wrong front page' );

                        return 1;
                    }
            )
    ]
);

# other tests to consider:
# - creating initial user
# - uploading a file
# - js? css?


$TEST;
