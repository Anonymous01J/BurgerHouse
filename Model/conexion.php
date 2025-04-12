<?php
    class conexion extends PDO{
        public $conn;
        function __construct(){
            
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "burgerhouse";

            try {
                $this->conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
                // set the PDO error mode to exception
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch(PDOException $e) {
                die("Error en la conexión: " . $e->getMessage());
            }
        }
    }
?>