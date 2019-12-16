<?php
$uidStr = file_get_contents('./file/1uid.txt');
$replaceStr = './file/1.txt';
$resultStr = './file/level.txt';

#file_put_contents($newCommonFile, $userKeyArr[$commonUid] . "\t" . $messageKeyArr[$commonUid] . PHP_EOL, FILE_APPEND);

#$arr = array_filter(explode("\r\n", str_replace(' ', '', $replaceStr)));
$uidArr = array_filter(explode(PHP_EOL, $uidStr));

function readFileByLine ($filename)
{
    $fh = fopen($filename, 'r');
    
    while (! feof($fh)) {
        $line = fgets($fh);
        $line = preg_replace("/\d{0,10}\)/", '', $line);
        $line = preg_replace("/\(nil/", '', $line);
        $line = str_replace('"','',$line);
        $line = str_replace('\\', '"', $line);

        $res[] = json_decode($line, true);
        
    }
    
    fclose($fh);

    return $res;
}

$levelArr = readFileByLine($replaceStr);
foreach ($levelArr as $key => $userLevel) {
    if ($userLevel) {
        $userLevel['uid'] = $uidArr[$key];
        $newLevel[] = $userLevel;
    }
}
foreach ($newLevel as $user) {
    file_put_contents($resultStr, $user['uid'] . "\t" . $user['level'] . PHP_EOL, FILE_APPEND);
}