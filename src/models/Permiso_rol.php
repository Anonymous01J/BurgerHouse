<?php
namespace Shtch\Burgerhouse\models;

class Permiso_rol extends Db_base {
    private $id;
    private $id_rol;
    private $id_permiso;

    public function __construct(
        $id = null,
        $id_rol = null,
        $id_permiso = null
    ) {
        parent::__construct("permiso_rol");
        
        $this->id = $id;
        $this->id_rol = $id_rol;
        $this->id_permiso = $id_permiso;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_rol" => $this->id_rol,
            "a.id_permiso" => $this->id_permiso
        ]);
    }
}