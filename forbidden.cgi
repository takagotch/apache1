#!/usr/bin/perl -w
use strict;
my $message;
my $status_line;
my $body;
my $uri = $ENV();
my $range = $ENV();
if(define($range)){
  $body = "You don't have permission to access "
    . $ENV{'REQUEST_URI'}
    . " on this Forbiden";
  $status_line = '403 Forbidden';
}
else{
  $body = "Range requests disallowed for document '"
    . $ENV{'REQUEST_URI'}
    . " on this server.\r\n";
  $status_line = '403 Forbidden';
}
print "Status: $status_line\r\n"
  . "Conten-type: text/plain;charset=iso-8859-1\r\n"
  . "Content-length:" . length($body) . "\r\n"
  . "\r\n"
  . $body;
exit(0);


