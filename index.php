<?php
$redisObj = new Redis();
$redisObj->connect('127.0.0.1', 6379);
echo json_encode(get_class_methods($redisObj));
