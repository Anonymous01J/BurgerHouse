<?php
    class Usuario extends DB {
        private $id;
        private $nombre;
        private $correo;
        private $hash;
        private $idRol;
        private $preguntaS;
        private $respuestaS;
        private $active;
        private $sesion_id;

        function __construct($id=null, $nombre=null,$correo=null,$hash=null,$idRol=null,$preguntaS=null,$respuestaS=null,$active=null,$sesion_id=null){           
            $this->id = $id;
            $this->nombre = $nombre;
            $this->correo = $correo;
            $this->hash = $hash;
            $this->idRol = $idRol;
            $this->preguntaS = $preguntaS;
            $this->respuestaS = $respuestaS;
            $this->active = $active;
            $this->sesion_id = $sesion_id;
            DB::__construct();
        }

        function agregar($usuario = 0){
            $query = $this->conn->prepare("INSERT INTO usuario (nombre, correo, hash, idRol, preguntaS, respuestaS, active) VALUES(:nombre, :correo, :hash, :idRol, :preguntaS, :respuestaS, :active)");
            $query->bindParam(':nombre',$this->nombre, PDO::PARAM_STR);
            $query->bindParam(':correo',$this->correo, PDO::PARAM_STR);
            $query->bindParam(':hash',$this->hash, PDO::PARAM_STR);
            $query->bindParam(':idRol',$this->idRol, PDO::PARAM_INT);
            $query->bindParam(':preguntaS',$this->preguntaS, PDO::PARAM_STR);
            $query->bindParam(':respuestaS',$this->respuestaS, PDO::PARAM_STR);
            $query->bindParam(':active',$this->active, PDO::PARAM_INT);
            $query->execute();
            $this->add_bitacora($usuario,"Usuarios","Registrar","Usuario Registrado");
        }

        function borrar($usuario) {
            $query = $this->conn->prepare("DELETE FROM usuario WHERE id=:id");
            $query->bindParam(':id',$this->id, PDO::PARAM_INT);
            $query->execute();
            $this->add_bitacora($usuario,"Usuarios","Eliminados","Usuario".$this->id." Eliminado");
        }

        function search($n=0,$limite=9){
            $query = "SELECT * FROM usuario WHERE 1";
            $lista = [];

            if ($this->id){
                array_push($lista,'id');
            }
            if ($this->correo != null){
                array_push($lista, 'correo');
            }
            if ($this->idRol != null){
                array_push($lista, 'idRol');
            }
            if ($lista) {
                foreach ($lista as $e){
                    $query .= ' AND '.$e.'=:'.$e;
                }
            }
            $n = $n*$limite;

            $query = $query . " LIMIT :l OFFSET :n";
            $consulta = $this->conn->prepare($query);

            $consulta->bindParam(':l',$limite, PDO::PARAM_INT);
            $consulta->bindParam(':n',$n, PDO::PARAM_INT);

            if ($this->id != null){
                $consulta->bindParam(':id',$this->id, PDO::PARAM_INT);
            }
            if ($this->correo != null){
                $consulta->bindParam(':correo',$this->correo, PDO::PARAM_STR);
            }
            if ($this->idRol != null){
                $consulta->bindParam(':idRol',$this->idRol, PDO::PARAM_INT);
            }
            $consulta->execute();
            return $consulta->fetchAll();
        }

        function actualizar($usuario){
            $query = 'UPDATE usuario SET nombre=:nombre, correo=:correo, hash=:hash, idRol=:idRol, preguntaS=:preguntaS, respuestaS=:respuestaS, active=:active WHERE id=:id';
            $query = $this->conn->prepare($query);
            $query->bindParam(':nombre',$this->nombre);
            $query->bindParam(':correo',$this->correo);
            $query->bindParam(':hash',$this->hash);
            $query->bindParam(':idRol',$this->idRol);
            $query->bindParam(':preguntaS',$this->preguntaS);
            $query->bindParam(':respuestaS',$this->respuestaS);
            $query->bindParam(':active',$this->active);
            $query->bindParam(':id',$this->id);
            $query->execute(); 
            $this->add_bitacora($usuario,"Usuario","Modificar","Usuario "."$id"." Modificado");
        }

        function login($usuario){
            $query = $this->conn->prepare('UPDATE usuario SET active=1 , sesion_id=:sesion_id WHERE id=:id');
            $query->bindParam(':id',$this->id);
            $query->bindParam(':sesion_id', $this->sesion_id);
            $query->execute();
            $this->add_bitacora($usuario,"Usuarios","Login","Usuario ".$this->nombre." logueado");
        }

        function logout($usuario) {
            $query = $this->conn->prepare('UPDATE usuario SET active=0 WHERE id=:id');
            $query->bindParam(':id',$this->id);
            $query->execute(); 
            $this->add_bitacora($usuario,"Usuarios","Logout","Usuario ".$this->nombre." des-logueado");
        }

        function COUNT(){
            $query = $this->conn->query("SELECT COUNT(*) as 'total' FROM usuario");
            return $query->fetch()['total'];
        }

        function verificar($contraseña){
            $query = "SELECT * FROM usuario WHERE correo=:correo";
            $consulta = $this->conn->prepare($query);
            $consulta->bindParam(':correo',$this->correo, PDO::PARAM_STR);
            $consulta->execute();
            $resultado = password_verify($contraseña,$consulta->fetchAll()[0]['hash']);
            return $resultado;
        }

        function cambiarPassword() {
            $query = "UPDATE usuario SET hash=:hash WHERE correo=:correo";
            $consulta = $this->conn->prepare($query);
            $consulta->bindParam(':correo',$this->correo, PDO::PARAM_STR);
            $consulta->bindParam(':hash',password_hash($this->hash, PASSWORD_DEFAULT), PDO::PARAM_STR);
            $consulta->execute();
        }

        function cambiarRol() {
            $query = "UPDATE usuario SET idRol=:idRol WHERE id=:id";
            $consulta = $this->conn->prepare($query);
            $consulta->bindParam(':id',$this->id, PDO::PARAM_INT);
            $consulta->bindParam(':idRol',$this->idRol, PDO::PARAM_INT);
            $consulta->execute();
            $this->add_bitacora($this->id,"Usuarios","Modifcar","Usuario ".$this->nombre." Cambio de rol");
        }
    }       
?>