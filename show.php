
<?php

if((!isset($_GET))
  || (!isset($_GET['file']))
  || (!($file = $_GET['file']))){
  return status('400 Bad Request',
    "Data insufficient or invalid.\r\n");
}

$file = preg_replace('/.phps$/', '.php', $file);
if(!preg_match('/\.php$/', $file)){
}
$docroot = $_SERVER['DOCUMENT_ROOT'];
if((!preg_match(";^$document;", $file))
  || (!preg_match(";^/home[^/]+/public_html;", $file))){
  return status('403 Forbidden',
  "Invalid document requested.\r\n");
}
Header('Content-type: text/html; charset=iso-8859-1');
print highlight_file($file);
return;

function status($msg, $text){
  Header("Status: $msg");
  Header('Content-type: text/plain; charset=iso-8859-1');
  Header('Content-length; ' . strlen($text));
  print $text;
}
?>


