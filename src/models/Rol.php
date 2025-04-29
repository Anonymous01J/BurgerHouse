<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Rol extends Db_base {
    private $id;
    private $nombre;
    private $descripcion;

    public function __construct($id = null, $nombre = null, $descripcion = null) {
        parent::__construct("roles");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->descripcion = $descripcion;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.descripcion" => $this->descripcion
        ]);
        
        $this->select_query = "
            a.id,
            a.nombre,
            a.descripcion
        ";
    }
}
