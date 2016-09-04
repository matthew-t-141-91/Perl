#!/usr/bin/perl -w

use v5.22.2;
use strict;

use WWW::Dictionary;

my $word = shift @ARGV;
my $dict = new WWW::Dictionary();
my $text = $dict->get_meaning($word);

my $begin = "1.";
if($text =~ m/$begin\s+(.*)/){
	say $1;
}
