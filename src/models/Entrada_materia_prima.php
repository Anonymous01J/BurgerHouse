<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_materia_prima extends Db_base {
    private $id;
    private $id_proveedor;
    private $id_materia_prima;
    private $fecha_compra;
    private $precio_compra;
    private $referencia;
    private $cantiad;
    private $existencia;

    public function __construct(
        $id = null,
        $id_proveedor = null,
        $id_materia_prima = null,
        $fecha_compra = null,
        $precio_compra = null,
        $referencia = null,
        $cantiad = null,
        $existencia = null,
    ) {
        parent::__construct("entradas_materia_prima");
        
        $this->id = $id;
        $this->id_provedor = $id_proveedor;
        $this->id_materia_prima = $id_materia_prima;
        $this->fecha_compra = $fecha_compra;
        $this->precio_compra = $precio_compra;
        $this->referencia = $referencia;
        $this->cantiad = $cantiad;
        $this->existencia = $existencia;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_proveedor" => $this->id_proveedor,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.fecha_compra" => $this->fecha_compra,
            "a.precio_compra" => $this->precio_compra,
            "a.referencia" => $this->referencia,
            "a.cantiad" => $this->cantiad,
            "a.existencia" => $this->existencia,
        ]);
    }
}