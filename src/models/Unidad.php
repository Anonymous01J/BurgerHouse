<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Unidad extends Db_base {
    private $id;
    private $nombre;
    private $nombre_like;

    public function __construct($id = null, $nombre = null, $nombre_like=null) {
        parent::__construct("unidades");
        $this->id = $id;
        $this->nombre = $nombre;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.nombre
        ";
    }
}
