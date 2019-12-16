<?php

class Db {

    private static $dbms = 'mysql';
    private static $host = '192.168.10.10';
    private static $port = 3306;
    private static $dbname = 'homestead';
    private static $username = 'homestead';
    private static $password = 'secret';

    private static $_instance = NULL;

    private function __construct()
    {

    }

    public static function getInstance()
    {
        if (is_null(self::$_instance)) {
            try {
                // self::$_instance = new PDO(self::getDsn(), self::$username, self::$password); // 不开启长连接
                self::$_instance = new PDO(self::getDsn(), self::$username, self::$password, [PDO::ATTR_PERSISTENT => true]); // 长连接
                self::$_instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (Exception $e) {
                die("Error!: " . $e->getMessage(). PHP_EOL);
            }
        }
        return self::$_instance;
    }

    private static function getDsn()
    {
        $dsn = self::$dbms . 
            ':host=' . self::$host .
            ';port=' . self::$port .
            ';dbname=' . self::$dbname;

        return $dsn;
    }

    public function __clone()
    {
        die('Clone is not allowed. ' . E_USER_ERROR);
    }
}

/**
 * pod 方法
 * [0]=>"__construct"
 * [1]=>"prepare"
 * [2]=>"beginTransaction"
 * [3]=>"commit"
 * [4]=>"rollBack"
 * [5]=>"inTransaction"
 * [6]=>"setAttribute"
 * [7]=>"exec"
 * [8]=>"query"
 * [9]=>"lastInsertId"
 * [10]=>"errorCode"
 * [11]=>"errorInfo"
 * [12]=>"getAttribute"
 * [13]=>"quote"
 * [14]=>"__wakeup"
 * [15]=>"__sleep"
 * [16]=>"getAvailableDrivers"
 */