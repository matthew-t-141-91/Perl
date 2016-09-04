#!/usr/bin/perl -w

use v5.22.2;
use strict;

use WWW::Mechanize;

my $url = shift @ARGV;
$url = "http://www." . $url;
my $mech = WWW::Mechanize->new();
$mech->get($url);
print $mech->content(format => 'text');