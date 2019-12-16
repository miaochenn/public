<?php

require_once 'conn.php';
//$redisObj->hSet('aaa', 'aa', 123);
var_dump($redisObj->hGet('aaa', 'ab'));