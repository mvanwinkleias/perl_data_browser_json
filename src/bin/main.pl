#!/usr/bin/perl

use strict;
use warnings;

use lib '/opt/IAS/lib/perl5';

use FindBin qw($RealBin);
use lib "$RealBin/../lib/perl5";

use IAS::DataStructure::Browser;

my $browser = IAS::DataStructure::Browser->new;

$browser->command_loop();
