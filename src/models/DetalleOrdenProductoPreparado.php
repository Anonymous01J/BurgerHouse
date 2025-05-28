<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class DetalleOrdenProductoPreparado extends Db_base {
    private $id;
    private $id_producto;
    private $id_orden;
    private $cantidad;
    private $descripcion;
    private $adicionales;

    public function __construct(
        $id = null,
        $id_producto = null,
        $id_orden = null,
        $cantidad = null,
        $descripcion = null,
        $adicionales = null
    ) {
        parent::__construct("producto_preparado_detalle_orden");

        $this->id = $id;
        $this->id_producto = $id_producto;
        $this->id_orden = $id_orden;
        $this->cantidad = $cantidad;
        $this->descripcion = $descripcion;
        $this->adicionales = $adicionales;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_producto" => $this->id_producto,
            "a.id_orden" => $this->id_orden,
            "a.cantidad" => $this->cantidad,
            "a.descripcion" => $this->descripcion,
            "a.adicionales" => $this->adicionales
        ]);
    }
}
