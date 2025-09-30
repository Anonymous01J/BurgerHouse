<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_materia_prima extends Db_base {
    private $id;
    private $id_proveedor;
    private $fecha_compra;

    public function __construct(
        $id = null,
        $id_proveedor = null,
        $fecha_compra = null,
    ) {
        parent::__construct("entradas_materia_prima");
        
        $this->id = $id;
        $this->id_proveedor = $id_proveedor;
        $this->fecha_compra = $fecha_compra;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_proveedor" => $this->id_proveedor,
            "a.fecha_compra" => $this->fecha_compra,
        ]);
    }
}