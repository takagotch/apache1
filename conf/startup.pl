#!/usr/bin/perl

BEGIN {
  use Apache ( );
  use lib Apache->server_root_relative('lib/perl');
}
use Apache::Registry ( );
use Apaceh::Constants ( );
use CGI qw(-compile :all);
use CGI::Carp ( );
1;


