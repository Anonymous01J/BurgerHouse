<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Ingrediente_producto extends Db_base {
    private $id;
    private $id_producto;
    private $id_materia_prima;
    private $cantidad;

    public function __construct(
        $id = null,
        $id_producto = null,
        $id_materia_prima = null,
        $cantidad = null
    ) {
        parent::__construct("ingredientes_producto");
        
        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->id_materia_prima = $id_materia_prima;
        $this->cantidad = $cantidad;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.cantidad" => $this->cantidad
        ]);
    }
}

    