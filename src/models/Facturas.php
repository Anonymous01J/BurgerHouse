<?php
namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Facturas extends Db_base {
    private $id;
    private $id_venta;
    private $i_producto;
    private $cantidad;
    private $monto;

    public function __construct(
        $id = null,
        $id_venta = null,
        $i_producto = null,
        $cantidad = null,
        $monto = null
    ) {
        parent::__construct("facturas");
        
        $this->id = $id;
        $this->id_venta = $id_venta;
        $this->i_producto = $i_producto;
        $this->cantidad = $cantidad;
        $this->monto = $monto;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_venta" => $this->id_venta,
            "a.i_producto" => $this->i_producto,
            "a.cantidad" => $this->cantidad,
            "a.monto" => $this->monto
        ]);
    }

}