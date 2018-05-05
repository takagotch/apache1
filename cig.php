#!/usr/bin/php
$fh = fopen($_SERVER['PATH_TRANSLATED'], 'r');
fpassthru($fh);
print "\n\n<p>\n"
  . "FOOTER GOES HERE\n"
  . "</p>\n"
return;



