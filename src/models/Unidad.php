<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Unidad extends Db_base {
    private $id;
    private $nombre;

    public function __construct($id = null, $nombre = null) {
        parent::__construct($id, "unidades");
        $this->id = $id;
        $this->nombre = $nombre;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre
        ]);

        $this->add_variables_like([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre
        ]);

        $this->select_query = "
            a.id,
            a.nombre
        ";
    }
}
