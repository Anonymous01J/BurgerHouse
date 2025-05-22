<?php
    namespace Shtch\Burgerhouse\models;
    use Shtch\Burgerhouse\models\Db_base;
    class Usuario extends Db_base{
        private $id;
        private $id_rol;
        private $nombre;
        private $apellido;
        private $hash;
        private $active;
        private $session_id;
        private $email;

        private $nombre_like;

        function __construct($id=null, $nombre=null,$hash=null,$id_rol=null,$active=null,$session_id=null, $email=null, $apellido=null, $nombre_like=null){
            parent::__construct("usuario");
            $this->id = $id;
            $this->nombre = $nombre;
            $this->hash = $hash;
            $this->id_rol = $id_rol;
            $this->active = $active;
            $this->session_id = $session_id;
            $this->email = $email;
            $this->apellido = $apellido;
            $this->nombre_like = $nombre_like;

            $this->add_variables([
                "a.id" => $this->id,
                "a.nombre" => $this->nombre,
                "a.hash" => $this->hash,
                "a.id_rol" => $this->id_rol,
                "a.active" => $this->active,
                "a.session_id" => $this->session_id,
                "a.email" => $this->email,
                "a.apellido" => $this->apellido
            ]);
            $this->select_query = "
                a.id,
                a.nombre,
                a.hash,
                roles.nombre rol,
                roles.id rol_id,
                a.active,
                a.session_id,
                a.email,
                a.apellido
            ";
            $this->joins = "
                INNER JOIN roles ON roles.id = a.id_rol
            ";

            $this->add_variables_like([
                "a.nombre" => $this->nombre_like
            ]);
        }
    }