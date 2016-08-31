#!/usr/bin/perl -w

use v5.22.2;
use strict;

use Socket;

## create a socket handle
socket(my $sock, AF_INET, SOCK_STREAM, getprotobyname('tcp'))
    or die "Error: $!";

## connect to some remote server
my $remote = "www.google.com";
my $port = 80;

my $iaddr = inet_aton($remote)
    or die "Unable to resolve hostname: $remote";
my $paddr =   sockaddr_in($port, $iaddr);

connect($sock, $paddr)
    or die "connect failed: $!";
say "Connected to $remote on port $port";

send($sock, "GET / HTTP/1.1\r\n\r\n" , 0)
    or die "Failed to send: !";

recv($sock, my $msg, 2000 , 0);

say $msg;

close($sock);
