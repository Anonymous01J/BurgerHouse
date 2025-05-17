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
    private $cantidad;
    private $existencia;
    private $comprobante;

    public function __construct(
        $id = null,
        $id_proveedor = null,
        $id_materia_prima = null,
        $fecha_compra = null,
        $precio_compra = null,
        $referencia = null,
        $cantidad = null,
        $existencia = null,
        $comprobante = null,
    ) {
        parent::__construct("entradas_materia_prima");
        
        $this->id = $id;
        $this->id_proveedor = $id_proveedor;
        $this->id_materia_prima = $id_materia_prima;
        $this->fecha_compra = $fecha_compra;
        $this->precio_compra = $precio_compra;
        $this->referencia = $referencia;
        $this->cantidad = $cantidad;
        $this->existencia = $existencia;
        $this->comprobante = $comprobante;

        $this->add_variables([
            "id" => $this->id,
            "id_proveedor" => $this->id_proveedor,
            "id_materia_prima" => $this->id_materia_prima,
            "fecha_compra" => $this->fecha_compra,
            "precio_compra" => $this->precio_compra,
            "referencia" => $this->referencia,
            "cantidad" => $this->cantidad,
            "existencia" => $this->existencia,
            "comprobante" => $this->comprobante,
        ]);
    }
}