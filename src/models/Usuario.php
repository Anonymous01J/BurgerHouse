<?php
    namespace Shtch\Burgerhouse\models;
    use Shtch\Burgerhouse\models\Db_base;
    class Usuario extends Db_base{
        private $id;
        private $nombre;
        private $hash;
        private $id_rol;
        private $active;
        private $session_id;

        function __construct($id=null, $nombre=null,$hash=null,$id_rol=null,$active=null,$session_id=null){
            parent::__construct($id, "usuario");
            $this->id = $id;
            $this->nombre = $nombre;
            $this->hash = $hash;
            $this->id_rol = $id_rol;
            $this->active = $active;
            $this->session_id = $session_id;
            $this->add_variables([
                "a.id" => $this->id,
                "a.nombre" => $this->nombre,
                "a.hash" => $this->hash,
                "a.id_rol" => $this->id_rol,
                "a.active" => $this->active,
                "a.session_id" => $this->session_id
            ]);
            $this->add_variables_like([
                "a.id" => $this->id,
                "a.id_rol" => $this->id_rol,
                "a.nombre" => $this->nombre
            ]);
            $this->add_variables_interval([
            ]);
            $this->select_query = "
                a.id,
                a.nombre,
                a.hash,
                roles.nombre rol,
                a.active,
                a.session_id
            ";
            $this->joins = "
                INNER JOIN roles ON roles.id = a.id_rol
            ";
        }
    }