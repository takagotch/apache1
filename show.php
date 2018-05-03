
<?php

if((!isset($_GET))
  || (!isset($_GET['file']))
  || (!($file = $_GET['file']))){
  return status('400 Bad Request',
    "Data insufficient or invalid.\r\n");
}

$file = preg_replace();
if(){
}
$docroot = $_SERVER[];
if()
  || (){
}
Header();
print highlight_file();
return;

function status($msg, $text){
  Header("Status: $msg");
}
>


