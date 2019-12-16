<?php
$redisObj = new Redis();
$redisObj->connect('127.0.0.1', 6379);
goto result;
echo json_encode(get_class_methods($redisObj));

$redisObj->zIncrBy('zset_key', 1, 'member_one');
$redisObj->zIncrBy('zset_key', 1, 'member_two');
$redisObj->zIncrBy('zset_key', 1, 'member_three');

result:
$res = $redisObj->zRevRange('zset_key', 0, 5, true);
var_dump($res);
