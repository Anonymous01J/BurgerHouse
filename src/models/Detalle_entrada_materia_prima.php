<?php
namespace Shtch\Burgerhouse\models;
use Shtch\Burgerhouse\models\Db_base;

class Detalle_entrada_materia_prima extends Db_base {
    private $id;
    private $codigo;
    private $id_materia_prima;
    private $id_entrada;
    private $fecha_vencimiento;
    private $cantidad;
    private $existencia;
    private $active;
    private $broken;

    public function __construct(
        $id = null,
        $id_materia_prima = null,
        $codigo = null,
        $fecha_vencimiento = null,
        $id_entrada = null,
        $cantidad = null,
        $existencia = null,
        $broken = null,
        $active = null,
        $imagen_name = null
    ) {
        parent::__construct("detalles_entradas_materia_prima");
        
        $this->id = $id;
        $this->id_materia_prima = $id_materia_prima;
        $this->id_entrada = $id_entrada;
        $this->codigo = $codigo;
        $this->fecha_vencimiento = $fecha_vencimiento;
        $this->cantidad = $cantidad;
        $this->existencia = $existencia;
        $this->broken = $broken;
        $this->active = $active;

        $this->add_variables([
            "a.id" => $this->id,
            "a.codigo" => $this->codigo,
            "a.id_materia_prima" => $this->id_materia_prima,
            "a.id_entrada" => $this->id_entrada,
            "a.fecha_vencimiento" => $this->fecha_vencimiento,
            "a.cantidad" => $this->cantidad,
            "a.existencia" => $this->existencia,
            "a.broken" => $this->broken,
            "a.active" => $this->active
        ]);

        $this->select_query = "
            a.id,
            proveedores.razon_social as nombre_proveedor,
            proveedores.id as id_proveedor,
            entradas_materia_prima.id as id_entrada,
            entradas_materia_prima.fecha_compra,
            materia_prima.nombre as nombre_materia_prima,
            materia_prima.id as id_materia_prima,
            unidades.alias as nombre_unidad,
            unidades.id as id_unidad,
            a.fecha_vencimiento,
            a.codigo,
            a.cantidad,
            a.existencia,
            a.broken,
            a.active,
            a.id_entrada
        ";

        $this->joins = "
        INNER JOIN entradas_materia_prima ON entradas_materia_prima.id = a.id_entrada
        INNER JOIN proveedores ON proveedores.id = entradas_materia_prima.id_proveedor
            INNER JOIN materia_prima ON materia_prima.id = a.id_materia_prima
            INNER JOIN unidades ON materia_prima.id_unidad = unidades.id
        ";
    }
}