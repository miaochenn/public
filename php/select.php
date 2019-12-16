<?php
include_once 'Db.php';

foreach (Db::getInstance()->query("select * from comment limit 12") as $row) {
    echo $row['title'] . PHP_EOL;
}