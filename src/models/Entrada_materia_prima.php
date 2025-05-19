<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_materia_prima extends Db_base {
    private $id;
    private $id_proveedor;
    private $codigo;
    private $id_materia_prima;
    private $fecha_compra;
    private $fecha_vencimiento;
    private $precio_compra;
    private $referencia;
    private $cantidad;
    private $existencia;
    private $comprobante;
    private $broken;

    public function __construct(
        $id = null,
        $id_proveedor = null,
        $id_materia_prima = null,
        $codigo = null,
        $fecha_compra = null,
        $fecha_vencimiento = null,
        $precio_compra = null,
        $referencia = null,
        $cantidad = null,
        $existencia = null,
        $comprobante = null,
        $broken = null,
        $imagen_name = null
    ) {
        parent::__construct("entradas_materia_prima");
        
        $this->id = $id;
        $this->id_proveedor = $id_proveedor;
        $this->id_materia_prima = $id_materia_prima;
        $this->fecha_compra = $fecha_compra;
        $this->codigo = $codigo;
        $this->fecha_vencimiento = $fecha_vencimiento;
        $this->precio_compra = $precio_compra;
        $this->referencia = $referencia;
        $this->cantidad = $cantidad;
        $this->existencia = $existencia;
        $this->comprobante = $imagen_name;
        $this->broken = $broken;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_proveedor" => $this->id_proveedor,
            "a.codigo" => $this->codigo,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.fecha_compra" => $this->fecha_compra,
            "a.fecha_vencimiento" => $this->fecha_vencimiento,
            "a.precio_compra" => $this->precio_compra,
            "a.referencia" => $this->referencia,
            "a.cantidad" => $this->cantidad,
            "a.existencia" => $this->existencia,
            "a.comprobante" => $this->comprobante,
            "a.broken" => $this->broken,
        ]);

        $this->select_query = "
            a.id,
            proveedores.razon_social as nombre_proveedor,
            materia_prima.nombre as nombre_materia_prima,
            unidades.alias as nombre_unidad,
            a.fecha_compra,
            a.fecha_vencimiento,
            a.precio_compra,
            a.codigo,
            a.referencia,
            a.cantidad,
            a.existencia,
            a.comprobante,
            a.broken
        ";

        $this->joins = "
            INNER JOIN proveedores ON proveedores.id = a.id_proveedor
            INNER JOIN materia_prima ON materia_prima.id = a.id_materia_prima
            INNER JOIN unidades ON materia_prima.id_unidad = unidades.id

        ";
    }
}