<?php
    namespace Shtch\Burgerhouse\models;
    use PDO;

    class Conexion{
        public $conn;
        function __construct($db_n=1){
            $GLOBALS['db_host'] = $GLOBALS['db'.$db_n]['host'];
            $GLOBALS['db_name'] = $GLOBALS['db'.$db_n]['name'];
            $GLOBALS['db_user'] = $GLOBALS['db'.$db_n]['user'];
            $GLOBALS['db_pass'] = $GLOBALS['db'.$db_n]['pass'];
            $this->conn = new PDO('mysql:host=' . $GLOBALS['db_host'] . ';dbname=' . $GLOBALS['db_name'], $GLOBALS['db_user'], $GLOBALS['db_pass']);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        function __destruct(){
            $this->conn = null;
        }
    }
?>