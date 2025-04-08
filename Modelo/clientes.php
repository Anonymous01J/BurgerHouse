<?php
require_once ('conexion.php');

class clientes extends conexion{
    private $Id_Cliente;
    private $nombre;
    private $correo;
    private $telefono;
    private $direccion;
    private $Pregunta_S;
    private $Respuesta_S;
    private $contrasena;

    function __construct($Id_Cliente=null, $nombre=null, $correo=null, $telefono=null, $direccion=null, $contrasena=null, $Pregunta_S=null, $Respuesta_S=null){
        $this->Id_Cliente = $Id_Cliente;
        $this->nombre = $nombre;
        $this->correo = $correo;
        $this->telefono = $telefono;
        $this->direccion = $direccion;
        $this->contrasena = $contrasena;
        $this->Pregunta_S = $Pregunta_S;
        $this->Respuesta_S = $Respuesta_S;
        parent::__construct();
    }

    public function search(){
        $search_sql = "SELECT * FROM clientes WHERE Estado=1";
        $stmt = $this->conn->prepare($search_sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function searchPerfil($Id_Cliente){
        $search_sql = "SELECT * FROM clientes WHERE Id_Cliente=:Id_Cliente";
        $stmt = $this->conn->prepare($search_sql);
        $stmt->bindParam(':Id_Cliente', $Id_Cliente, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function searchI(){
        $search_sql = "SELECT * FROM clientes WHERE Estado=0";
        $stmt = $this->conn->prepare($search_sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    public function login($Correo, $Contrasena){
        $login_sql = "SELECT * FROM clientes WHERE Correo=:Correo AND Contrasena=:Contrasena AND Estado=1";
        $stmt = $this->conn->prepare($login_sql);
        $stmt->bindParam(':Correo', $Correo, PDO::PARAM_STR);
        $stmt->bindParam(':Contrasena', $Contrasena, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function insert($nombre, $correo, $telefono, $direccion, $contrasena, $Pregunta_S, $Respuesta_S){
        $insert_sql = "INSERT INTO clientes (Nombre, Correo, Telefono, Direccion, contrasena, Pregunta_S, Respuesta_S) VALUES(:Nombre, :Correo, :Telefono, :Direccion, :contrasena, :Pregunta_S, :Respuesta_S)";
        $stmt = $this->conn->prepare($insert_sql);
        $stmt->bindParam(':Nombre', $nombre);
        $stmt->bindParam(':Correo', $correo);
        $stmt->bindParam(':Telefono', $telefono);
        $stmt->bindParam(':Direccion', $direccion);
        $stmt->bindParam(':contrasena', $contrasena);
        $stmt->bindParam(':Pregunta_S', $Pregunta_S);
        $stmt->bindParam(':Respuesta_S', $Respuesta_S);
        $stmt->execute();
    }

    public function update($nombre,$correo,$telefono,$direccion,$contrasena,$Pregunta_S,$Respuesta_S,$Id_Cliente){
        $update_sql = "UPDATE clientes SET Nombre=:Nombre, Correo=:Correo, Telefono=:Telefono, Direccion=:Direccion, contrasena=:contrasena, Pregunta_S=:Pregunta_S, Respuesta_S=:Respuesta_S WHERE Id_Cliente=:Id_Cliente";
        $stmt = $this->conn->prepare($update_sql);
        $stmt->bindParam(':Nombre', $nombre);
        $stmt->bindParam(':Correo', $correo);
        $stmt->bindParam(':Telefono', $telefono);
        $stmt->bindParam(':Direccion', $direccion);
        $stmt->bindParam(':contrasena', $contrasena);
        $stmt->bindParam(':Pregunta_S', $Pregunta_S);
        $stmt->bindParam(':Respuesta_S', $Respuesta_S);
        $stmt->bindParam(':Id_Cliente', $Id_Cliente);
        $stmt->execute();
    }

    public function delete($Id_Cliente){
        $delete_sql = "UPDATE clientes SET Estado = 0 WHERE Id_Cliente=:Id_Cliente";
        $stmt = $this->conn->prepare($delete_sql);
        $stmt->bindParam(':Id_Cliente', $Id_Cliente);
        $stmt->execute();
    }
    public function restaurar($Id_Cliente){
        $restaurar_sql = "UPDATE clientes SET Estado = 1 WHERE Id_Cliente=:Id_Cliente";
        $stmt = $this->conn->prepare($restaurar_sql);
        $stmt->bindParam(':Id_Cliente', $Id_Cliente, PDO::PARAM_INT);
        $stmt->execute();
    }
    public function updatePsw($correo, $contrasena,$Pregunta_S, $Respuesta_S){
        $update_sql = "UPDATE clientes SET contrasena=:contrasena WHERE Correo=:correo AND Pregunta_S=:Pregunta_S AND Respuesta_S=:Respuesta_S";
        $stmt = $this->conn->prepare($update_sql);
        $stmt->bindParam(':contrasena', $contrasena, PDO::PARAM_STR);
        $stmt->bindParam(':correo', $correo, PDO::PARAM_STR);
        $stmt->bindParam(':Respuesta_S', $Respuesta_S, PDO::PARAM_STR);
        $stmt->bindParam(':Pregunta_S', $Pregunta_S, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt;
    }
    public function correoExiste($correo){
        $sql = "SELECT * FROM clientes WHERE Correo = :correo";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':correo', $correo, PDO::PARAM_STR);
        $stmt->execute();
        
        // If number of rows returned is more than 0, email exists
        if($stmt->rowCount() > 0){
            return true;
        } else {
            return false;
        }
    }
}
?>