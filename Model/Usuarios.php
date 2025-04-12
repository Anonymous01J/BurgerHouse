<?php
namespace BurgerHouse\Model;
use BurgerHouse\Model\Conexion;
use PDO;
class Usuarios extends conexion {
    private $email;
    private $name;
    public function __construct($email = null, $name = null) {
        $this->email = $email;
        $this->name = $name;
        parent::__construct();
    }

    public function getUserByEmail($email) {
        $stmt = $this->conn->prepare("SELECT * FROM users WHERE email = :email");
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function createUser($userData) {
        $stmt = $this->conn->prepare("INSERT INTO usuarios (correo, nombre) VALUES (:email, :name,)");
        $stmt->bindParam(':email', $userData['email'], PDO::PARAM_STR);
        $stmt->bindParam(':name', $userData['name'], PDO::PARAM_STR);
        return $stmt->execute();
    }
}