#!/usr/bin/perl

use v5.22.2;
use strict;

use WWW::Scripter;
use HTML::FormatText;
use HTML::Parse;

my $w = new WWW::Scripter;
$w->use_plugin('JavaScript');
$w->get('https://sports.yahoo.com/nfl/scoreboard/');
my $content = $w->content;

open my $fh, ">", "scores.html";
print $fh $content;

my $html = parse_htmlfile("scores.html");
my $formatter = HTML::FormatText->new(leftmargin => 0, rightmargin => 50);
my $ascii = $formatter->format($html);

open my $fh_, ">", "scores.txt";
print $fh_ $ascii;
