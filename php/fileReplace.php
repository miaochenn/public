<?php
$uids = file_get_contents('./file/uid.txt');
$users = file_get_contents('./file/user.txt');
$message = file_get_contents('./file/message.txt');
$newCommonFile = './file/common.txt';

$userArr = array_filter(explode("\r\n", $users));

$userUids = $userUidsAll = [];
foreach ($userArr as $user) {
    if (!($userUid = explode("\t", $user)[0])) {
        continue;
    }
    $userUids[] = $userUid;
}
$userUidsAll = array_filter(explode("\r\n", $uids));

$commonUids = array_values(array_intersect($userUids, $userUidsAll));

foreach ($userArr as $user) {
    $userExp = explode("\t", $user);
    $userKeyArr[$userExp[0]] = $user;
}

$userMessges = array_filter(explode("\r\n", $message));

foreach ($userMessges as $userMessge) {
    $messageExp = explode("\t", $userMessge);
    $messageKeyArr[$messageExp[0]] = $messageExp[1];
}

$process = 0;
foreach ($commonUids as $commonUid) {
    echo $process++ . PHP_EOL;
    file_put_contents($newCommonFile, $userKeyArr[$commonUid] . "\t" . $messageKeyArr[$commonUid] . PHP_EOL, FILE_APPEND);
}
print_r('OK!!!');