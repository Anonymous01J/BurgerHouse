<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Entrada_producto_procesado extends Db_base {
    private $id;
    private $id_producto;
    private $id_proveedor;
    private $codigo;
    private $id_unidad;
    private $fecha_vencimiento;
    private $fecha_compra;
    private $cantidad;
    private $existencia;
    private $active;
    private $broken;

    public function __construct(
        $id = null,
        $id_producto = null,
        $id_proveedor = null,
        $fecha_compra = null,
        $cantidad = null,
        $existencia = null,
        $broken = null,
        $id_unidad = null,
        $fecha_vencimiento = null,
        $codigo = null,
        $active = null,
    ) {
        parent::__construct("entradas_producto_procesado");
        
        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->id_proveedor = $id_proveedor;
        $this->fecha_compra = $fecha_compra;
        $this->cantidad = $cantidad;
        $this->existencia = $existencia;
        $this->broken = $broken;
        $this->id_unidad = $id_unidad;
        $this->fecha_vencimiento = $fecha_vencimiento;
        $this->codigo = $codigo;
        $this->active = $active;
    

        $this->add_variables([
            "a.id" => $this->id,
            "a.codigo" => $this->codigo,
            "a.id_unidad" => $this->id_unidad,
            "a.fecha_vencimiento" => $this->fecha_vencimiento,
            "a.broken" => $this->broken,
            "a.id_producto" => $this->id_producto,
            "a.id_proveedor" => $this->id_proveedor,
            "a.fecha_compra" => $this->fecha_compra,
            "a.cantidad" => $this->cantidad,
            "a.existencia" => $this->existencia,
            "a.active" => $this->active
        ]);

        $this->select_query = "
            a.id,
            proveedores.razon_social as nombre_proveedor,
            proveedores.id as id_proveedor,
            productos_procesados.id as id_producto,
            productos_procesados.nombre as nombre_producto,
            unidades.nombre as nombre_unidad,
            unidades.alias as alias_unidad,
            unidades.id as id_unidad,
            a.fecha_compra,
            a.fecha_vencimiento,
            a.codigo,
            a.cantidad,
            a.existencia,
            a.broken,
            a.active
        ";

        $this->joins = "
            INNER JOIN productos_procesados ON productos_procesados.id = a.id_producto
            INNER JOIN proveedores ON proveedores.id = a.id_proveedor
            INNER JOIN unidades ON unidades.id = a.id_unidad
        ";
    }
}