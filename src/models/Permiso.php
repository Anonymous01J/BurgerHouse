<?php
namespace Shtch\Burgerhouse\models;

class Permiso extends Db_base {
    private $id;
    private $nombre;

    public function __construct(
        $id = null,
        $nombre = null
    ) {
        parent::__construct("permisos");
        
        $this->id = $id;
        $this->nombre = $nombre;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre
        ]);
    }
}