<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Pago_venta extends Db_base
{
    private $id;
    private $id_venta;
    private $id_pago;

    public function __construct(
        $id = null,
        $id_pago = null,
        $id_venta = null
    ) {
        parent::__construct("pago_venta");

        $this->id = $id;
        $this->id_pago = $id_pago;
        $this->id_venta = $id_venta;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_pago" => $this->id_pago,
            "a.id_venta" => $this->id_venta
        ]);
        $this->select_query = "
        a.id,
        a.id_pago,
        a.id_venta,
        p.comprobante,
        p.referencia,
        p.tasa,
        mp.nombre as metodo_pago,
        p.monto
        ";

        $this->joins = "
        INNER JOIN ventas v ON a.id_venta = v.id
        INNER JOIN pagos p ON a.id_pago = p.id
        INNER JOIN metodo_pago mp ON p.id_metodo_pago = mp.id
        ";
    }
}
