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
        $this->nro_orden = null;
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
    }
}
