<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_producto_procesado extends Db_base {
    private $id;
    private $id_producto;
    private $id_proveedor;
    private $fecha_compra;
    private $precio_compra;
    private $referencia;
    private $cantidad;
    private $existencia;
    private $comprobante;
    

    public function __construct(
        $id = null,
        $id_producto = null,
        $id_proveedor = null,
        $fecha_compra = null,
        $precio_compra = null,
        $referencia = null,
        $cantidad = null,
        $existencia = null,
        $comprobante = null,
    ) {
        parent::__construct("entradas_producto_procesado");
        
        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->id_proveedor = $id_proveedor;
        $this->fecha_compra = $fecha_compra;
        $this->precio_compra = $precio_compra;
        $this->referencia = $referencia;
        $this->cantidad = $cantidad;
        $this->existencia = $existencia;
        $this->comprobante = $comprobante;
    

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
            "a.id_proveedor" => $this->id_proveedor,
            "a.fecha_compra" => $this->fecha_compra,
            "a.precio_compra" => $this->precio_compra,
            "a.referencia" => $this->referencia,
            "a.cantidad" => $this->cantidad,
            "a.existencia" => $this->existencia,
            "a.comprobante" => $this->comprobante,
        ]);
    }
}