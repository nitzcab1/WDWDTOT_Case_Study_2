<?php
define("DB_HOST", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "z7a18q");
define("DB_NAME", "webdevr10");
define("BASE_URL",((!empty($_SERVER['HTTPS'])? 'https':'http'))."://".$_SERVER['HTTP_HOST'].dirname($_SERVER['SCRIPT_NAME']))
?>