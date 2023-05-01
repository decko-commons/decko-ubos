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
    $command = "decko setup";
} elsif ($operation eq 'upgrade') {
    $command = "decko update";
}

if ($command) {
    my $out;
    my $full_command = "cd $datadir; sudo -u http bundle exec $command";
    if( UBOS::Utils::myexec( $full_command, undef, \$out, \$out )) {
        # This will complain that it cannot write to ~http (/srv/http)
        # for the .bundle directory. Instead it will create a temporary
        # directory. As bundler does not make this setting configurable,
        # that's the best we can do, see also
        # https://github.com/bundler/bundler/blob/477115c0699c89a940171c4911dbc2b060054f84/lib/bundler.rb#L172
        error( "$full_command failed: ", $out );
    }
}

1;

