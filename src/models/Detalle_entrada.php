<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;


class Detalle_entrada extends Db_base {
    private $id;
    private $id_entrada;
    private $id_materia_prima;
    private $cantidad;

    public function __construct(
        $id = null,
        $id_entrada = null,
        $id_materia_prima = null,
        $cantidad = null
    ) {
        parent::__construct("detalle_entrada");
        
        $this->id = $id;
        $this->id_entrada = $id_entrada;
        $this->id_materia_prima = $id_materia_prima;
        $this->cantidad = $cantidad;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_entrada" => $this->id_entrada,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.cantidad" => $this->cantidad
        ]);
    }
}
