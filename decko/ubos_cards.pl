#!/usr/bin/perl
#
# Invoke the Rails db:migrate
#
# Copyright (C) 2017 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;
use warnings;

use UBOS::Logging;
use UBOS::Utils;

my $datadir = $config->getResolve( 'appconfig.datadir' );
my $command;

if ($operation eq 'install') {
    $command = "decko seed";
} elsif ($operation eq 'upgrade') {
    $command = "decko update";
}

if ($command) {
    my $out;
    my $full_command = "cd $datadir; sudo -u http bundle exec $command";
    if( UBOS::Utils::myexec( $full_command )) {
        error( "$full_command failed" );
    }
}

exit(1);
