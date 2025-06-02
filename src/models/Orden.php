<?php

namespace Shtch\Burgerhouse\models;

use Shtch\Burgerhouse\models\Db_base;

class Orden extends Db_base
{
    private $id;
    private $nro_orden;
    private $id_cliente;
    private $fecha;
    private $tipo;
    private $status;

    public function __construct(
        $id = null,
        $nro_orden = null,
        $id_cliente = null,
        $fecha = null,
        $tipo = null,
        $status = null

    ) {
        parent::__construct("orden");
        $this->id = $id;
        $this->nro_orden = $nro_orden;
        $this->id_cliente = $id_cliente;
        $this->fecha = $fecha;
        $this->tipo = $tipo;
        $this->status = $status;


        $this->add_variables([
            "a.id" => $this->id,
            "a.nro_orden" => $this->nro_orden,
            "a.id_cliente" => $this->id_cliente,
            "a.fecha" => $this->fecha,
            "a.tipo" => $this->tipo,
            "a.status" => $this->status
        ]);
        $this->select_query = "
            a.id,
            a.nro_orden,
            a.id_cliente,
            ventas.id as id_venta,
            clientes.nombre AS cliente_nombre,
            clientes.apellido AS cliente_apellido,
            clientes.telefono AS cliente_telefono,
            ventas.direccion as direccion,
            a.fecha,
            a.status,
            a.tipo
        ";
        $this->joins = "
            INNER JOIN clientes ON clientes.id = a.id_cliente
            INNER JOIN ventas ON ventas.id_orden = a.id

        ";
    }
}
