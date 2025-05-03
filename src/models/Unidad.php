<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Unidad extends Db_base {
    private $id;
    private $nombre;
    private $alias;
    private $active;
    private $nombre_like;

    public function __construct($id = null, $nombre = null, $alias = null, $active = null, $nombre_like=null) {
        parent::__construct("unidades");
        $this->id = $id;
        $this->nombre = $nombre;
        $this->alias = $alias;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.alias" => $this->alias,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.alias,
            a.active
        ";
    }
}
