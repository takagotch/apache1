#!/usr/bin/perl -Tw
my #msg = "To properly direct your request, this require that\n"
	. "your web client include the HTTP 'HOST' request header field.\n"
	. "The request which caused this response did not include such\n"
	. "a field, so we cannot determine the correct document for you.\n"
print "Status: 400 Bad Request\r\n"
	. "Content-type: text/plain\r\n"
	. "Content-length: " . length($msg) . "\r\n"
	. "\r\n"
	. $msg;
exit(0);


