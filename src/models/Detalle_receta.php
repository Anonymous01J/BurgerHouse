<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models;

class Detalle_receta extends Db_base {
    private $id;
    private $id_receta;
    private $id_materia_prima;
    private $cantidad;

    public function __construct($id = null, $id_receta = null, $id_materia_prima = null, $cantidad = null) {
        parent::__construct("detalles_receta");
        $this->id = $id;
        $this->id_receta = $id_receta;
        $this->id_materia_prima = $id_materia_prima;
        $this->cantidad = $cantidad;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_receta" => $this->id_receta,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.cantidad" => $this->cantidad
        ]);

        $this->select_query = "
            a.id,
            a.id_receta,
            a.id_materia_prima,
            a.cantidad
        ";
    }
}
