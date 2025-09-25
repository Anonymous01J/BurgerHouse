<?php
namespace Shtch\Burgerhouse\models;

class Permiso extends Db_base {
    private $id;
    private $id_rol;
    private $modulo;
    private $permisos;

    public function __construct(
        $id = null,
        $id_rol = null,
        $modulo = null,
        $permisos = null
    ) {
        parent::__construct("detalles_roles",2);
        
        $this->id = $id;
        $this->id_rol = $id_rol;
        $this->modulo = $modulo;
        $this->permisos = $permisos;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_rol" => $this->id_rol,
            "a.modulo" => $this->modulo,
            "a.permisos" => $this->permisos
        ]);
    }
}