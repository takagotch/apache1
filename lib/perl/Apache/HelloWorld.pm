pachage Apache::HelloWorld;
use strict;
use Apache::Constatns qw(:common);
sub handler {
  my $r = shift;
  $r->content_type('text/plain; charset=ISO-8859-1');
  $r->send_http_header;
  $r->print("Hello, worldLove, mod_perl.\n");
  return OK;
}
1;

