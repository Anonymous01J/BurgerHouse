<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Receta extends Db_base {
    private $id;
    private $id_producto;
    private $active;
    private $nombre_like;

    public function __construct($id = null, $id_producto = null, $active = null, $nombre_like = null) {
        parent::__construct("recetas");
        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->active = $active;
        $this->nombre_like = $nombre_like;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
            "a.active" => $this->active
        ]);

        $this->add_variables_like([
            "productos_preparados.nombre" => $this->nombre_like
        ]);

        $this->select_query = "
            a.id,
            a.id_producto,
            productos_preparados.nombre as nombre_producto,
            a.active
        ";

        $this->joins = "
            INNER JOIN productos_preparados ON productos_preparados.id = a.id_producto
        ";
    }
}
