#!/usr/bin/perl -w

use v5.22.2;
use strict;
use diagnostics;

use XML::RSS::Feed;
use LWP::Simple;

my $feed = XML::RSS::Feed->new(
	url =>	"http://rss.slashdot.org/Slashdot/slashdotMain/to",
	name => "slashdot"
);

while(1){
	$feed->parse(get($feed->url));
    print $_->headline . "\n" for $feed->late_breaking_news;
    sleep($feed->delay); 
}