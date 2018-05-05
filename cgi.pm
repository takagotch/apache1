#!/usr/bin/perl
use CGI;
use strict;
use warnings;

my $from = CGI->new;

my $name = $form->param('favorite_foods');

print "Content-type: text/html\n\n";
print 'Name: ' . "<br />/n";
print "Favorite foods: <ul>\n"
foreach my $food (@foods){
  print "<li>$food</li>\n";
}
print "</ul>\n";


