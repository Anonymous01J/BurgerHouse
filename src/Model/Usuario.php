<?php
    use Shtechnologyx\Pt3\Model\Db_base;
    class Usuarios extends Db_base{
        private $id;
        private $nombre;
        private $correo;
        private $hash;
        private $id_rol;
        private $active;
        private $sesion_id;

        function __construct($id=null, $nombre=null,$correo=null,$hash=null,$id_rol=null,$active=null,$sesion_id=null){
            parent::__construct($id, "usuario");
            $this->id = $id;
            $this->nombre = $nombre;
            $this->correo = $correo;
            $this->hash = $hash;
            $this->id_rol = $id_rol;
            $this->active = $active;
            $this->sesion_id = $sesion_id;
            $this->add_variables([
                "a.id" => $this->id,
                "a.nombre" => $this->nombre,
                "a.correo" => $this->correo,
                "a.hash" => $this->hash,
                "a.id_rol" => $this->id_rol,
                "a.active" => $this->active,
                "a.sesion_id" => $this->sesion_id
            ]);
            $this->add_variables_like([
                "a.id" => $this->id,
                "a.id_rol" => $this->id_rol,
                "a.nombre" => $this->nombre,
                "a.correo" => $this->correo
            ]);
            $this->add_variables_interval([
            ]);
            $this->select_query = "
                a.id,
                a.nombre,
                a.correo,
                a.hash,
                roles.nombre rol,
                a.active,
                a.sesion_id
            ";
            $this->joins = "
                INNER JOIN roles ON roles.id = a.id_rol
            ";
        }
    }