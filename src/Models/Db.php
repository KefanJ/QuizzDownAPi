<?php

namespace App\Models;


use \PDO;

class DB
{
   private $host = 'localhost';
    //private $host = '192.168.1.12';
    private $user = 'root';
    private $pass = '';
    private $dbname = 'quizz-down';

    public function connect()
    {
        $conn_str = "mysql:host=$this->host;dbname=$this->dbname";
        $conn = new PDO($conn_str, $this->user, $this->pass);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $conn;
    }
}
