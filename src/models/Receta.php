<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Receta extends Db_base {
    private $id;
    private $nombre;

    public function __construct($id = null, $nombre = null) {
        parent::__construct("recetas");
        $this->id = $id;
        $this->nombre = $nombre;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre
        ]);

        $this->select_query = "
            a.id,
            a.nombre
        ";
    }
}
