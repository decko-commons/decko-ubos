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

  checks      => [
    new UBOS::WebAppTest::StateCheck(
      name  => 'virgin',
      check => sub {
        my $c = shift;
        $c->getMustContain('/', 'Your deck is ready to go', 200, 'Wrong front page');
        return 1;
      }
    ),
    new UBOS::WebAppTest::StateTransition(
      name       => 'setting up',
      transition => sub {
        my $c = shift;

        my $postData = {
          'setup'         => '1',
          'card[name]'    => 'Nancy User',
          'card[type]'    => 'User',
          'card[subcards][+*account][subcards][+*email][content]' => 'nancy@user.com',
          'card[subcards][+*account][subcards][+*password][content]' => 'nancypass'
        };

        my $response = $c->post('/card/create', $postData);
        $c->mustStatus($response, undef, 'Setup failed');

        return 1;
      }
    ),
    new UBOS::WebAppTest::StateCheck(
      name  => 'setup',
      check => sub {
        my $c = shift;
        $c->getMustContain('/', 'Welcome, Card Shark', 200, 'Wrong front page');
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
