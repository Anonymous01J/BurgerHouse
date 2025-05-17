<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Receta extends Db_base {
    private $id;
    private $nombre;
    private $nombre_like;
    private $id_producto;

    public function __construct($id = null, $nombre = null, $nombre_like = null, $id_producto = null) {
        parent::__construct("recetas");
        $this->id = $id;
        $this->nombre = $nombre;
        $this->nombre_like = $nombre_like;
        $this->id_producto = $id_producto;

        $this->add_variables([
            "a.id" => $this->id,
            "a.nombre" => $this->nombre,
            "a.id_producto" => $this->id_producto,
        ]);

        $this->add_variables_like([
            "a.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.nombre,
            a.id_producto
        ";
    }
}
