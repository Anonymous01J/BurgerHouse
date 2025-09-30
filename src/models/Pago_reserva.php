<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Pago_reserva extends Db_base
{
    private $id;
    private $id_reserva;
    private $id_pago;

    public function __construct(
        $id = null,
        $id_reserva = null,
        $id_pago = null
    ) {
        parent::__construct("pago_reserva");

        $this->id = $id;
        $this->id_reserva = $id_reserva;
        $this->id_pago = $id_pago;

        $this->add_variables([
            "a.id" => $this->id,
            "a.id_reserva" => $this->id_reserva,
            "a.id_pago" => $this->id_pago
        ]);
        $this->select_query = "
        a.id,
        a.id_reserva,
        a.id_pago,
        p.comprobante,
        p.referencia,
        mp.nombre as metodo_pago,
        p.monto,
        o.id as id_orden
        ";
        $this->joins = "
        INNER JOIN reservaciones r ON a.id_reserva = r.id
        INNER JOIN pagos p ON a.id_pago = p.id
        INNER JOIN metodo_pago mp ON p.id_metodo_pago = mp.id
        INNER JOIN orden o ON r.id_orden = o.id
        ";
    }
}
