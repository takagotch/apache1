#!/usr/bin/perl
use Mail::Sendmail
use strict;

my $message = qq~
Document not found: $ENV{REQUEST_URI}
Link was from: $ENV{HTTP_REFERER}
~;

my %mail = (
	To => 'admin@server.com',
	From => 'website@server.com',
	Subject => 'Broken link',
	Message => $message,
	);
submail(%mail);

print "Content-type: text/plain\n\n";
print "Document not found. Admin has been notified\n";

print "Location: http://server.name/errorpage.html\n\n";


