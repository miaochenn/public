<?php

include_once 'Db.php';

$picUrls = serialize(['https://static.app.new.tongzhuogame.com/default/avatar.png', 'https://static.app.new.tongzhuogame.com/promotions/e0986c81-f4fd-4cbd-845a-8ec191d7a323.png']);

for ($i=1038617; $i<10000000; $i++) {
    $title = 'title_' . $i;
    $content = 'content_' . $i;
    $uid = mt_rand(100000000, 999999999);
    $sql = "insert into comment (uid, title, content, pic_urls) values ('$uid', '$title', '$content', '$picUrls')";
    // Db::getInstance()->exec($sql);

    echo $i . PHP_EOL;
}
