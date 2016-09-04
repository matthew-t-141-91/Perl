#!/usr/bin/perl -w

use v5.22.2;
use strict;

use WWW::IP;

my $ip = get_ip();

say $ip;