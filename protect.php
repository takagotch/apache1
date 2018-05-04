<?php
  Header('Content-type: text/plain');
  $body = sprintf("Document requested was: %s\n", $_SERVER['REMOTE_URI']);
  Header('Content-length' . strlen($body));
  print $body;
?>


