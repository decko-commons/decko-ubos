
#!/usr/bin/perl
#
# Sets up the directory / file structure for logging from a Rails app
#
# Copyright (C) 2017 and later, Indie Computing Corp. All rights reserved. License: see package.
#

use strict;
use warnings;

use UBOS::Logging;
use UBOS::Utils;

my $appconfigid = $config->getResolve( 'appconfig.appconfigid' );
my $appid       = $config->getResolve( 'appconfig.appid' );

my $logDir  = "/var/log/$appid/$appconfigid";
my $logFile = "$logDir/production.log";

if ($operation eq 'deploy') {
    unless (-d $logDir) {
        UBOS::Utils::mkdirDashP($logDir, 0755, 'http', 'http');
    }
    unless (-e $logFile) {
        UBOS::Utils::saveFile($logFile, '', 0644, 'http', 'http');
    }
}

1;