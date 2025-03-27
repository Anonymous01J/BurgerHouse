<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Categoria_materia_prima extends Db_base {
    private $id;
    private $nombre;
    private $tipo;
    private $active;

    public function __construct($id = null, $nombre = null, $tipo = null, $active = null) {
        parent::__construct("categoria_materia_prima");
        
        $this->id = $id;
        $this->nombre = $nombre;
        $this->tipo = $tipo;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.tipo" => $this->tipo,
            "a.active" => $this->active
        ]);
        
        $this->select_query = "
            a.id,
            a.nombre,
            a.tipo,
            a.active
        ";
    }
}